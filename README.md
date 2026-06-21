# Shain Designer Kit

A Claude Code configuration for designers and vibe-coders. Includes 7 specialized agents, 6 rule files, 3 custom commands, a curated library of design skills, and a structured workflow pipeline that turns Claude Code into your design & development team.

**For:** Designers who build their own interfaces, vibe-coders, and anyone who wants to go from idea to working product without deep coding knowledge.

**Stack:** Any. React, Vue, Svelte, vanilla HTML — this config adapts to your project.

## How to Use

### Option A: New project (recommended)

1. Download the kit — **Code → Download ZIP** — and unzip it.
2. Rename the folder to your project's name (e.g. `photo-portfolio`).
3. Open that folder in Claude Code (`claude .`, or open it in the desktop app).

That's it. **On first launch the kit installs its design skills automatically, in
the background** — you don't have to run anything. Claude reads `CLAUDE.md`, loads
the rules, and has all agents ready. Just describe what you want to build.

> Prefer git? `git clone https://github.com/Dishain/shain-designer-kit.git my-project`
> then open the folder. (Manual install is never required, but `./install.sh` is
> there as a fallback.)

### Option B: Add to existing project

```bash
# Grab the kit
git clone https://github.com/Dishain/shain-designer-kit.git /tmp/cdk

# Copy config files into your project
cp -r /tmp/cdk/.claude /path/to/your-project/
cp /tmp/cdk/CLAUDE.md /path/to/your-project/
cp /tmp/cdk/.mcp.json /path/to/your-project/
cp -r /tmp/cdk/docs /path/to/your-project/
cp /tmp/cdk/install.sh /tmp/cdk/update.sh /path/to/your-project/
```

Open your project in Claude Code — the design skills install automatically on the
first session.

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

### Agents (8)

| Agent | Purpose | Model |
|-------|---------|-------|
| `ba` | Requirements analysis, feature planning, MVP scoping | opus |
| `ux-researcher` | User flows, information architecture, wireframes | opus |
| `ui-builder` | Visual design, component building, Figma-to-code, styling | opus |
| `design-reviewer` | Anti-AI-slop & craft review of built pages (via `impeccable`) | opus |
| `accessibility-auditor` | WCAG 2.1 AA compliance, contrast, keyboard nav, ARIA | sonnet |
| `developer` | Code implementation, API integration, state management | sonnet |
| `copywriter` | UX copy, microcopy, error messages, button labels | sonnet |
| `tester` | Visual QA, responsive testing, functional testing | sonnet |

> Design-system work is handled by the `shain-dls` skill (see Design Skills below), not a dedicated agent.

### Rules (8)

| Rule | Purpose |
|------|---------|
| `workflow.md` | Agent pipeline: BA → UX → UI → Design-Reviewer → A11y → Developer → Tester |
| `design-skills-policy.md` | Default style (`impeccable`), choosing another, and the anti-slop pass |
| `design-principles.md` | Visual hierarchy, typography, color, spacing, responsive, motion |
| `code-style.md` | Multi-stack code conventions (React, Vue, Svelte, Python, HTML) |
| `verification.md` | Self-verification loop before reporting work done |
| `skills.md` | How design skills are installed, updated, and security-checked |
| `updates.md` | How the kit keeps itself up to date with upstream |
| `git-operations.md` | Commit/push safety, PR format |

### Commands (3)

| Command | Purpose |
|---------|---------|
| `/figma-to-code` | Convert Figma designs to working code |
| `/review-design` | Comprehensive design review (UX + UI + A11y + Copy) |
| `/use-design-md` | Drop a brand `DESIGN.md` (Linear, Vercel, …) into the project for matching UI |

### Design Skills

**Installed automatically on first launch** (in the background) from pinned upstream sources — never silently vendored. No command needed; `./install.sh` exists only as a manual fallback. See `.claude/skills/SOURCES.md` for the full manifest, source links, pinned commits, and licenses, and `.claude/rules/skills.md` for the update + security policy.

| Source | What it adds |
|--------|--------------|
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | `impeccable` — holistic interface craft, audit, critique & polish |
| [anthropics/skills](https://github.com/anthropics/skills) | `frontend-design` |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | `ui-ux-pro-max` — UI styles, palettes, typography, UX guidelines |
| [Owl-Listener/designer-skills](https://github.com/Owl-Listener/designer-skills) | ~95 design skills (research, IA, UI, interaction, critique, design systems) |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | `emil-design-eng`, `review-animations` — micro-animations & interaction polish |
| [Mindrally/skills](https://github.com/Mindrally/skills) | `lottie` — performant Lottie animations on the web |
| [Dishain/Shain-Design-System-Skill](https://github.com/Dishain/Shain-Design-System-Skill) | `shain-dls` — token-based design systems |

**Reference resources** (not skills): [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) (brand `DESIGN.md` files, via `/use-design-md`) and [awesome-design-systems](https://github.com/alexpate/awesome-design-systems) (a curated list of real-world design systems for inspiration).

**How styles are chosen:** by default the kit builds UI in the `impeccable` style. Say *"use ui-ux-pro-max"*, *"follow our design system"* (`shain-dls`), or `/use-design-md <brand>` to switch the look. Whatever the style, after each page is built the `design-reviewer` agent runs an `impeccable` pass to clean up AI slop — without overriding your chosen style. See `.claude/rules/design-skills-policy.md`.

### Workflow Pipeline

```
Standard Feature:  BA → UX-Researcher → UI-Builder → Design-Reviewer → A11y Auditor → Developer → Tester
Design Only:       BA → UX-Researcher → UI-Builder → Design-Reviewer → A11y Auditor
Bug Fix:           Developer → Tester
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
description: "What this agent does. Trigger words — EN: keyword1, keyword2. Trigger words — UA: слово1, слово2."
model: sonnet
color: blue
---

# Agent Title

Instructions for the agent...
```

### Add a New Rule

Create `.claude/rules/my-rule.md` with markdown content. Rules are auto-loaded for every conversation.

### Bilingual Support

All agents include trigger words in English (primary) and Ukrainian (fallback). To add another language, extend the description field in the YAML frontmatter.

## Staying up to date

Projects are usually started from a downloaded archive, so the kit files can
fall behind. The kit checks for its own updates and can pull them safely:

- On session start, a hook (`.claude/scripts/bootstrap.sh`) installs skills on
  first run and quietly checks the upstream repo for kit updates (at most once a
  day). If a newer version exists, Claude tells you and offers to update.
- Run `./update.sh` to apply. It backs up the current kit files to
  `.kit-backup/` first, then replaces **only kit-owned files** (agents, rules,
  commands, scripts, `CLAUDE.md`, `README.md`, `GUIDE.md`, `install.sh`).
- It **never** touches your work, your project memory (`docs/lessons.md`,
  `docs/todo.md`), your API keys (`.mcp.json`), or `.claude/settings.json`.
- `./update.sh --check` just reports whether an update is available.

See `.claude/rules/updates.md` for the full policy. The current version is in
`VERSION`.

## Related projects

- [MooseDesign1/DDD — Design Driven Development](https://github.com/MooseDesign1/DDD-DesignDrivenDevelopment) — a full design-first Claude Code framework (separate project, not bundled here).

## License

MIT for this kit. Bundled design skills keep their own upstream licenses — `install.sh` pulls them from source rather than redistributing copies. See `.claude/skills/SOURCES.md` for each skill's license (note: `emilkowalski/skills` ships without an explicit license, so it is fetched at install time and never copied into this repo).
