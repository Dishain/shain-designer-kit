# Design Skills — Sources

These skills are **not vendored** into this repo. `install.sh` fetches each one
from its pinned upstream commit, scans it for risky patterns, and copies it into
`~/.claude/skills/`. This keeps the kit small, respects upstream licenses, and
lets updates flow from the original authors.

Update + security policy: see [`.claude/rules/skills.md`](../rules/skills.md).

| Skill(s) | Source | Pinned commit | License |
|----------|--------|---------------|---------|
| `frontend-design` | [anthropics/skills](https://github.com/anthropics/skills) (`skills/frontend-design`) | `5754626` | no explicit license ⚠️ |
| `impeccable` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) (`.claude/skills/impeccable`) | `a110ec5` | Apache-2.0 |
| `ui-ux-pro-max` | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | `7538cfb` | MIT |
| `designer-skills` (~95 skills) | [Owl-Listener/designer-skills](https://github.com/Owl-Listener/designer-skills) | `acc3e57` | MIT |
| `emil-design-eng`, `review-animations` | [emilkowalski/skills](https://github.com/emilkowalski/skills) | `43d8284` | no explicit license ⚠️ |
| `lottie` | [Mindrally/skills](https://github.com/Mindrally/skills) (`lottie`) | `05a7130` | Apache-2.0 |
| `shain-dls` | [Dishain/Shain-Design-System-Skill](https://github.com/Dishain/Shain-Design-System-Skill) | `9675ea2` | MIT |

⚠️ **No explicit license** on `emilkowalski/skills` and `anthropics/skills`.
They are fetched at install time and never copied into this repository (the user
downloads them from source themselves, like `git clone`). Use locally, do not
redistribute.

ℹ️ **`impeccable` can run a CLI.** Its `SKILL.md` declares
`allowed-tools: Bash(npx impeccable *)`, so when active it may invoke the
`impeccable` npm package. It's a widely used, open (Apache-2.0) tool, but be
aware it executes `npx`.

## What the `designer-skills` bundle covers

Installed under `~/.claude/skills/designer-skills/` (Claude discovers nested
skills by their `name:` frontmatter, so the folder layout doesn't matter):

- **design-research** — user-persona, journey-map, empathy-map, jobs-to-be-done, interview-script, usability-test-plan, …
- **ux-strategy** — information-architecture, design-brief, design-principles, content-strategy, opportunity-framework, …
- **ui-design** — visual-hierarchy, color-system, typography-scale, spacing-system, layout-grid, responsive-design, dark-mode-design, …
- **interaction-design** — animation-principles, micro-interaction-spec, form-design, loading-states, feedback-patterns, onboarding-design, …
- **design-systems** — design-token, accessibility-audit, motion-system, naming-convention, theming-system, component-spec, …
- **prototyping-testing** — wireframe-spec, user-flow-diagram, heuristic-evaluation, test-scenario, click-test-plan, accessibility-test-plan, …
- **design-ops / designer-toolkit / visual-critique** — design-critique, handoff-spec, ux-writing, critique-*, …

## Updating

Re-run `./install.sh` after bumping a pinned commit in that script. Do **not**
bump blindly — follow the review steps in `.claude/rules/skills.md` first.

## Reference resources (not skills)

These are reading/reference collections, not installable skills:

- [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md)
  (MIT) — brand `DESIGN.md` files. Use the `/use-design-md` command to drop one
  into a project.
- [alexpate/awesome-design-systems](https://github.com/alexpate/awesome-design-systems)
  (Unlicense / public domain) — a curated list of real-world design systems
  (Polaris, Material, Carbon, …). Browse it for inspiration and prior art when
  building a design system with `shain-dls`.
