## Claude-Specific Behavior

- Use available Skills for UX research, UI design, accessibility, frontend, copywriting
- If a Skill applies, prefer it over repeating rules here

## IMPORTANT

1. Before writing any code, describe your approach and wait for approval.
2. If requirements are ambiguous, ask clarifying questions before writing code.
3. Explain things simply — the user may not have deep coding knowledge.
4. If a task requires changes to more than 3 files, stop and break it into smaller tasks.
5. When there's a bug, explain what went wrong in plain language, then fix it.
6. Every time I correct you, reflect on what went wrong and plan to prevent it.

## Core Principles

- **Designer First**: Speak in design terms. Reference visual outcomes, not implementation details.
- **Simplicity First**: Make every change as simple as possible. Minimal code, maximum result.
- **Show, Don't Tell**: When possible, create a working prototype instead of describing what to do.
- **No Stack Lock-in**: This config works with any frontend stack — React, Vue, Svelte, vanilla HTML, Telegram bots, anything.

## Task Management

1. **Plan First**: Write plan to `docs/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step in plain language
5. **Document Results**: Add review section to `docs/todo.md`
6. **Capture Lessons**: Update `docs/lessons.md` after corrections

## Agent Dispatch (MANDATORY)

- **ALWAYS** follow the agent pipeline defined in `.claude/rules/workflow.md`
- **ALWAYS** run independent pipeline steps in parallel (e.g., Accessibility Auditor + Copywriter can run simultaneously)
- **ALWAYS** autonomously determine which agents should execute each part of the user's task — do NOT ask the user which agent to use
- Available agents: `ba`, `ux-researcher`, `ui-builder`, `accessibility-auditor`, `developer`, `bot-developer`, `copywriter`, `design-system-manager`, `tester`
- For every non-trivial task: analyze → select agents → dispatch in parallel where possible → collect results → verify

## Rules (auto-loaded from `.claude/rules/`)

- `workflow.md` — Agent pipeline: BA → UX-Researcher → UI-Builder → A11y Auditor → Developer → Tester
- `design-principles.md` — Visual hierarchy, spacing, typography, color, responsive design
- `code-style.md` — Clean code conventions (multi-stack: React, Vue, Svelte, Python, HTML)
- `git-operations.md` — Commit/push rules, PR description format
