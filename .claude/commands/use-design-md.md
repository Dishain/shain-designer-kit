# Use a Brand DESIGN.md

Drop a curated brand `DESIGN.md` into the current project so the UI you build
matches a known design language (Linear, Vercel, Stripe, Apple, etc.).

Source: [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md)
(MIT) — a collection of `DESIGN.md` files distilled from popular brand design
systems. This is a **reference resource**, not a skill.

## Input

The user names a brand or vibe (e.g. "make it feel like Linear", "use a Vercel
look", "clean fintech style").

## Steps

### 1. Pick the closest DESIGN.md
- Browse the `design-md/` folder of the source repo (via the `github` MCP or
  `gh api repos/VoltAgent/awesome-design-md/contents/design-md`).
- Match the user's brand/vibe to the closest available file. If several fit,
  show 2–3 options and let the user choose.

### 2. Add it to the project
- Fetch the chosen file's raw contents.
- Save it as `DESIGN.md` at the project root (or `docs/DESIGN.md` if the project
  keeps design docs in `docs/`).
- Briefly summarize, in plain language, the key tokens it sets (colors,
  typography, spacing, motion) so the user knows what changed.

### 3. Wire it into the build
- Treat `DESIGN.md` as the source of truth for the `ui-builder` agent.
- If the project has a real design system, prefer the `shain-dls` skill and use
  `DESIGN.md` only to fill gaps — don't let it override existing tokens.

## Output

A `DESIGN.md` in the project plus a short summary of the design language it
encodes, ready for `ui-builder` to follow.
