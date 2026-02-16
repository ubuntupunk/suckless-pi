# Downstream Changes

This document tracks all changes made in this fork that differ from upstream `badlogic/pi-mono`.

## Version
**Current:** `0.52.13-suckless.1`  
**Based on upstream:** `v0.52.12`

## Philosophy
This fork follows the [Suckless Philosophy](https://suckless.org/philosophy/):
- Simplicity over features
- Clarity over cleverness  
- Minimal dependencies
- User control

## Core Changes

### Version Check (`packages/coding-agent/src/modes/interactive/interactive-mode.ts`)
- **Why:** Prevent update notifications when running a custom version
- **Change:** Proper semver comparison that strips `-suckless.*` suffix
- **Commit:** `a4884789`

### System Prompt (`packages/coding-agent/src/core/system-prompt.ts` or similar)
- **Why:** Implement Suckless philosophy in agent behavior
- **Change:** Modified system prompt to emphasize simplicity and user control
- **Commit:** `c27d2ae8`

### Dependencies (`package.json` files)
- **Why:** Fix global installation issues
- **Change:** Added `strip-ansi` as explicit dependency
- **Commit:** `0c73de1c`

## Documentation Changes

### AGENTS.md
- **Why:** Adapt for downstream repository context
- **Commit:** `921697b0`

### CONTRIBUTING.md
- **Why:** Add Suckless manifesto and guidelines
- **Commit:** `601e32b3`

## Build/Version Changes

### Version numbering
- **Format:** `<upstream-version>-suckless.<patch>`
- **Example:** `0.52.13-suckless.1`
- **Commit:** `9f8969cf`

## Merge Procedure

When merging upstream changes:

1. **Fetch upstream:**
   ```bash
   git fetch upstream
   ```

2. **Review upstream changes:**
   ```bash
   git log --oneline HEAD..upstream/main
   git diff HEAD..upstream/main --stat
   ```

3. **Merge and resolve conflicts:**
   ```bash
   git merge upstream/main
   ```

4. **Check for regressions in downstream changes:**
   ```bash
   # Review files we've modified
   git diff --name-only upstream/main..main
   ```

5. **Run checks:**
   ```bash
   npm run check
   ./test.sh
   ```

6. **Bump version if needed:**
   ```bash
   # Update version in package.json files
   npm run version:patch  # or minor/major
   ```

## Files Commonly Modified

| File | Reason |
|------|--------|
| `packages/coding-agent/src/modes/interactive/interactive-mode.ts` | Version check, UI customizations |
| `packages/*/package.json` | Version bumps, dependency fixes |
| `package.json` (root) | Root version, dependencies |
| `packages/ai/src/models.generated.ts` | Regenerated on build |
| `README.md`, `CONTRIBUTING.md` | Documentation |

## Testing Before Merge

Always test these after merging upstream:
- [ ] `pi --version` shows correct version
- [ ] No update notification appears
- [ ] Extensions load correctly
- [ ] Theme system works
- [ ] Core tools (read, bash, edit, write) function

## Contact
Maintainer: ubuntupunk  
Repository: https://github.com/ubuntupunk/suckless-pi
