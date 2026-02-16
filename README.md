# Suckless Pi

> "Software is like entropy. It is difficult to grasp, weighs nothing, and obeys the Second Law of Thermodynamics; i.e., it always increases." — Norman Augustine

In the world of AI agents, entropy is the default state. Extensions are added as "hacks," system prompts grow into bloated monologues, and dependencies form opaque chains of "instruction slop."

**Suckless Pi** is a rejection of this entropy. It is an application of the [Suckless Philosophy](https://suckless.org/) to the personal AI stack.

## Philosophy

### 1. Minimalist Core
If a tool can be a shell script, it shouldn't be an npm package. If a prompt can be a single sentence, it shouldn't be a paragraph. We strip away the "AI-generated boilerplate" to find the functional core.

### 2. Sovereignty over Consumption
Relying on upstream `main` branches makes you a consumer of drift. We vendor our tools locally. We audit every line. We own our internal monologue. Your agent's "voice" should not change because a 3rd party decided to "optimize" their prompt.

### 3. Auditability
A "suckless" extension is one that can be audited in a single sitting. If you cannot read the entire source of your agent's tools in 5 minutes, you are running code you don't understand and logic you don't control.

### 4. The Craft of the Curator
We move from "functional velocity" (make it work at any cost) to "sovereign craft" (make it elegant, minimal, and stable). Every item in this repository is here for a reason. If the reason disappears, the code follows.

### 5. Principles
- **Code is a liability**: Keep it small to minimize the attack surface and the cognitive load.
- **Simplicity is stability**: Fewer moving parts mean fewer points of failure in the chat loop.
- **Vetting over Updating**: We cherry-pick features and pin them. We don't follow the stream; we build the dam.

---

<p align="center">
  <a href="https://shittycodingagent.ai">
    <img src="https://shittycodingagent.ai/logo.svg" alt="pi logo" width="128">
  </a>
</p>
<p align="center">
  <a href="https://discord.com/invite/3cU7Bz4UPx"><img alt="Discord" src="https://img.shields.io/badge/discord-community-5865F2?style=flat-square&logo=discord&logoColor=white" /></a>
  <a href="https://github.com/badlogic/pi-mono/actions/workflows/ci.yml"><img alt="Build status" src="https://img.shields.io/github/actions/workflow/status/badlogic/pi-mono/ci.yml?style=flat-square&branch=main" /></a>
</p>
<p align="center">
  <a href="https://pi.dev">pi.dev</a> domain graciously donated by
  <br /><br />
  <a href="https://exe.dev"><img src="packages/coding-agent/docs/images/exy.png" alt="Exy mascot" width="48" /><br />exe.dev</a>
</p>

## Pi Monorepo

> **Looking for the pi coding agent?** See **[packages/coding-agent](packages/coding-agent)** for installation and usage.

Tools for building AI agents and managing LLM deployments.

## Packages

| Package | Description |
|---------|-------------|
| **[@mariozechner/pi-ai](packages/ai)** | Unified multi-provider LLM API (OpenAI, Anthropic, Google, etc.) |
| **[@mariozechner/pi-agent-core](packages/agent)** | Agent runtime with tool calling and state management |
| **[@mariozechner/pi-coding-agent](packages/coding-agent)** | Interactive coding agent CLI |
| **[@mariozechner/pi-mom](packages/mom)** | Slack bot that delegates messages to the pi coding agent |
| **[@mariozechner/pi-tui](packages/tui)** | Terminal UI library with differential rendering |
| **[@mariozechner/pi-web-ui](packages/web-ui)** | Web components for AI chat interfaces |
| **[@mariozechner/pi-pods](packages/pods)** | CLI for managing vLLM deployments on GPU pods |

## Contributing

This is a downstream repository derived from the original [pi-mono](https://github.com/badlogic/pi-mono) project.

- For issues and PRs directly related to this downstream repository (such as suckless-specific modifications, local extensions, or downstream-only features), please submit them here.
- For general issues or improvements that benefit the upstream project, please submit PRs to the [original pi-mono repository](https://github.com/badlogic/pi-mono) first.
- Only submit PRs to this repository if they are specifically related to the suckless philosophy implementation or downstream-specific changes.

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines and [AGENTS.md](AGENTS.md) for project-specific rules (for both humans and agents).

## Development

```bash
npm install          # Install all dependencies
npm run build        # Build all packages
npm run check        # Lint, format, and type check
./test.sh            # Run tests (skips LLM-dependent tests without API keys)
./pi-test.sh         # Run pi from sources (must be run from repo root)
```

> **Note:** `npm run check` requires `npm run build` to be run first. The web-ui package uses `tsc` which needs compiled `.d.ts` files from dependencies.

## License

MIT

This project is a downstream derivation of the original [pi-mono](https://github.com/badlogic/pi-mono) project, which is also licensed under MIT. All original licensing terms remain in effect for the underlying codebase.