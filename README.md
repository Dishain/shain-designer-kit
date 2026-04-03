# Claude Designer Kit

A Claude Code configuration for designers and vibe-coders. Includes 9 specialized agents, 4 rule files, 2 custom commands, and a structured workflow pipeline that turns Claude Code into your design & development team.

**For:** Designers who build their own interfaces, vibe-coders, and anyone who wants to go from idea to working product without deep coding knowledge.

**Stack:** Any. React, Vue, Svelte, vanilla HTML, Telegram bots — this config adapts to your project.

## What's Included

### Agents (9)

| Agent | Purpose | Model |
|-------|---------|-------|
| `ba` | Requirements analysis, feature planning, MVP scoping | opus |
| `ux-researcher` | User flows, information architecture, wireframes, conversation design | opus |
| `ui-builder` | Visual design, component building, Figma-to-code, styling | opus |
| `accessibility-auditor` | WCAG 2.1 AA compliance, contrast, keyboard nav, ARIA | sonnet |
| `developer` | Code implementation, API integration, state management | sonnet |
| `bot-developer` | Telegram bots with aiogram/python-telegram-bot | sonnet |
| `copywriter` | UX copy, microcopy, error messages, button labels | sonnet |
| `design-system-manager` | Design tokens, component libraries, style guides | sonnet |
| `tester` | Visual QA, responsive testing, functional testing | sonnet |

### Rules (4)

| Rule | Purpose |
|------|---------|
| `workflow.md` | Agent pipeline: BA → UX → UI → A11y → Developer → Tester |
| `design-principles.md` | Visual hierarchy, typography, color, spacing, responsive |
| `code-style.md` | Multi-stack code conventions (React, Vue, Svelte, Python, HTML) |
| `git-operations.md` | Commit/push safety, PR format |

### Commands (2)

| Command | Purpose |
|---------|---------|
| `/figma-to-code` | Convert Figma designs to working code |
| `/review-design` | Comprehensive design review (UX + UI + A11y + Copy) |

### Workflow Pipeline

```
Standard Feature:  BA → UX-Researcher → UI-Builder → A11y Auditor → Developer → Tester
Design Only:       BA → UX-Researcher → UI-Builder → A11y Auditor
Telegram Bot:      BA → UX-Researcher → Bot-Developer → Tester
Bug Fix:           Developer (or Bot-Developer) → Tester
```

## Quick Start

### Step 1: Copy Configuration

```bash
git clone https://github.com/YOUR_USERNAME/claude-designer-kit.git /tmp/claude-designer-kit

cp -r /tmp/claude-designer-kit/.claude /path/to/your-project/
cp /tmp/claude-designer-kit/CLAUDE.md /path/to/your-project/
cp /tmp/claude-designer-kit/.mcp.json /path/to/your-project/
```

### Step 2: Configure MCP Servers

Edit `.mcp.json` and set your API keys:

- `FIGMA_API_KEY` — get from Figma → Settings → Personal Access Tokens
- `CONTEXT7_API_KEY` — get from [Context7](https://context7.com)
- `GITHUB_PERSONAL_ACCESS_TOKEN` — get from GitHub → Settings → Developer settings → Tokens

### Step 3: Customize

Edit `CLAUDE.md` to add project-specific instructions:
- Your design system details
- Project-specific conventions
- Preferred frameworks or libraries

## Customization

### Add a New Agent

Create `.claude/agents/my-agent.md`:

```yaml
---
name: my-agent
description: "What this agent does. Trigger words — EN: keyword1. Trigger words — UA: слово1. Trigger words — RU: слово1."
model: sonnet
color: blue
---

# Agent Title

Instructions for the agent...
```

### Add a New Rule

Create `.claude/rules/my-rule.md` with markdown content. Rules are auto-loaded for every conversation.

### Trilingual Support

All agents include trigger words in English, Ukrainian, and Russian. To add another language:

```
Trigger words — DE: schlüsselwort1, schlüsselwort2.
```

## License

MIT
