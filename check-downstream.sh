#!/bin/bash
# Check for potential regressions before merging upstream changes
# Usage: ./check-downstream.sh

set -e

echo "=== Downstream Change Regression Check ==="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if upstream remote exists
if ! git remote | grep -q "^upstream$"; then
    echo -e "${RED}Error: 'upstream' remote not found${NC}"
    echo "Add it with: git remote add upstream https://github.com/badlogic/pi-mono.git"
    exit 1
fi

# Fetch upstream
echo "Fetching upstream..."
git fetch upstream --quiet

# Show what would be merged
echo ""
echo "=== Upstream changes to merge ==="
git log --oneline --graph HEAD..upstream/main | head -20

# Count changes
UPSTREAM_COMMITS=$(git rev-list --count HEAD..upstream/main 2>/dev/null || echo "0")
echo ""
echo "Total upstream commits: $UPSTREAM_COMMITS"

# Show our downstream changes
echo ""
echo "=== Our downstream changes ==="
git log --oneline --grep="downstream:" --grep="suckless:" --all | head -10

# Check for conflicts in commonly modified files
echo ""
echo "=== Checking for potential conflicts ==="
CONFLICT_FILES=(
    "packages/coding-agent/src/modes/interactive/interactive-mode.ts"
    "packages/coding-agent/src/core/system-prompt.ts"
    "package.json"
    "packages/*/package.json"
)

for file in "${CONFLICT_FILES[@]}"; do
    if git diff --quiet upstream/main..main -- "$file" 2>/dev/null; then
        : # No changes in this file
    else
        if git merge-base --is-ancestor HEAD upstream/main 2>/dev/null; then
            : # Upstream is ahead, might conflict
        fi
        echo -e "${YELLOW}Modified: $file${NC}"
    fi
done

# Run checks
echo ""
echo "=== Running pre-merge checks ==="

if command -v bun &> /dev/null; then
    echo "Running: bun run check"
    bun run check || {
        echo -e "${RED}Checks failed! Fix issues before merging.${NC}"
        exit 1
    }
else
    echo "Running: npm run check"
    npm run check || {
        echo -e "${RED}Checks failed! Fix issues before merging.${NC}"
        exit 1
    }
fi

echo ""
echo -e "${GREEN}All checks passed!${NC}"
echo ""
echo "Ready to merge. Use:"
echo "  git merge upstream/main"
echo ""
echo "Then test:"
echo "  - pi --version (should show suckless version)"
echo "  - No update notification"
echo "  - Extensions load correctly"
