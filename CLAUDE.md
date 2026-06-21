## Claude-Specific Behavior

- Use available Skills for UX research, UI design, accessibility, frontend, copywriting
- If a Skill applies, prefer it over repeating rules here
- Skills install automatically on first launch (background, via `.claude/scripts/bootstrap.sh`) from pinned sources — see `.claude/skills/SOURCES.md`. If you see a `SHAIN_KIT_INSTALLING:` notice, tell the user skills are still installing. Follow `.claude/rules/skills.md` for update + security checks before applying any skill update.
- **Default design style is the `impeccable` skill.** If the user picks another style (`ui-ux-pro-max`, `shain-dls`, a brand `DESIGN.md`, Figma), use that for the look — see `.claude/rules/design-skills-policy.md`.
- After any page/screen is built, dispatch the `design-reviewer` agent for an `impeccable` anti-slop pass that respects the chosen style.
- When building or refining any interface, always activate the `emil-design-eng` skill for micro-animations.

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
- **No Stack Lock-in**: This config works with any frontend stack — React, Vue, Svelte, vanilla HTML, anything.

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
- Available agents: `ba`, `ux-researcher`, `ui-builder`, `design-reviewer`, `accessibility-auditor`, `developer`, `copywriter`, `tester`
- For every non-trivial task: analyze → select agents → dispatch in parallel where possible → collect results → verify

## Rules (auto-loaded from `.claude/rules/`)

- `workflow.md` — Agent pipeline: BA → UX-Researcher → UI-Builder → Design-Reviewer → A11y Auditor → Developer → Tester
- `design-skills-policy.md` — Default style (`impeccable`), how to pick another, and the anti-slop review pass
- `design-principles.md` — Visual hierarchy, spacing, typography, color, responsive design
- `code-style.md` — Clean code conventions (multi-stack: React, Vue, Svelte, Python, HTML)
- `verification.md` — **Self-verification loop**: always check your own work before reporting done (browser, screenshots, tests)
- `skills.md` — How design skills are installed, updated, and security-checked (pinned sources)
- `updates.md` — At session start, if you see a `KIT_UPDATE_AVAILABLE:` notice, tell the user and offer to run `./update.sh`
- `git-operations.md` — Commit/push rules, PR description format
