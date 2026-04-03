# Claude Designer Kit

A Claude Code configuration for designers and vibe-coders. Includes 9 specialized agents, 4 rule files, 2 custom commands, and a structured workflow pipeline that turns Claude Code into your design & development team.

**For:** Designers who build their own interfaces, vibe-coders, and anyone who wants to go from idea to working product without deep coding knowledge.

**Stack:** Any. React, Vue, Svelte, vanilla HTML, Telegram bots — this config adapts to your project.

## How to Use

### Option A: New project (start from scratch)

```bash
# Clone the kit
git clone https://github.com/Dishain/claude-designer-kit.git my-project
cd my-project

# Open in Claude Code
claude .          # CLI
# or open this folder in Claude Code desktop app
```

Claude will automatically read CLAUDE.md, load the rules, and have access to all agents. Just describe what you want to build.

### Option B: Add to existing project

```bash
# Clone the kit temporarily
git clone https://github.com/Dishain/claude-designer-kit.git /tmp/cdk

# Copy config files into your project
cp -r /tmp/cdk/.claude /path/to/your-project/
cp /tmp/cdk/CLAUDE.md /path/to/your-project/
cp /tmp/cdk/.mcp.json /path/to/your-project/
cp -r /tmp/cdk/docs /path/to/your-project/
```

Then open your project in Claude Code as usual.

### What happens when you start working

1. Claude reads `CLAUDE.md` and loads all rules automatically
2. You describe what you want: *"Make me a landing page for my photography portfolio"*
3. Claude picks the right agents for the job (BA → UX → UI → Developer → Tester)
4. Progress is tracked in `docs/todo.md`
5. When you correct Claude, it saves the lesson to `docs/lessons.md` (project memory)
6. Next session, Claude reads `lessons.md` first — it won't repeat the same mistakes

## Project Memory

The kit includes a self-improvement system:

- **`docs/todo.md`** — Claude writes the task plan here and tracks progress with checkboxes
- **`docs/lessons.md`** — After every correction, Claude records what went wrong and the rule to follow. This file persists between sessions, so Claude learns your preferences over time.

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

## MCP Servers

The `.mcp.json` includes these integrations (configure API keys as needed):

| Server | Purpose |
|--------|---------|
| Figma | Fetch designs, extract tokens, screenshots |
| Shadcn UI | Component library reference |
| Context7 | Up-to-date framework documentation |
| GitHub | PR, issues, code access |

### Configure API Keys

Edit `.mcp.json` and set:
- `FIGMA_API_KEY` — Figma → Settings → Personal Access Tokens
- `CONTEXT7_API_KEY` — [context7.com](https://context7.com)
- `GITHUB_PERSONAL_ACCESS_TOKEN` — GitHub → Settings → Developer settings → Tokens

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

All agents include trigger words in English, Ukrainian, and Russian. To add another language, extend the description field in the YAML frontmatter.

## License

MIT
