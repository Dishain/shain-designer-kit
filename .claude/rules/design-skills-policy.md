# Design Skill Policy

How the kit decides which design skill drives the look of an interface, and how
the anti-slop review works. This is the source of truth for `ui-builder` and
`design-reviewer`.

## 1. Default style: `impeccable`

Unless the user picks something else, the **default design language is the
`impeccable` skill**. `ui-builder` builds with impeccable as the source of
visual craft and taste.

## 2. Choosing a different style

The user can override the visual style at any time, in plain words:

- *"use ui-ux-pro-max"* → take the aesthetic from `ui-ux-pro-max` (67 UI styles,
  palettes, font pairings)
- *"use shain-dls" / "follow our design system"* → follow the project's
  token-based design system via `shain-dls`
- *"/use-design-md <brand>"* → match a brand `DESIGN.md` (Linear, Vercel, …)
- a **Figma link** → match the Figma design

When a style is chosen, `ui-builder` takes the **aesthetic from that skill**, not
from impeccable. **Don't stack multiple style skills at once** — pick one source
of visual style per piece of UI.

To set a project-wide default, the user just says so once; record it at the top
of `docs/todo.md` (e.g. `Style: ui-ux-pro-max`) so it persists across sessions.

## 3. Always: the anti-slop review pass (agentic)

After **any page or screen is built**, the `design-reviewer` agent runs
automatically as a separate pass:

1. It activates the `impeccable` skill (audit / critique / craft references).
2. It audits the built UI for **AI slop** and objective **craft issues**.
3. **It respects the chosen visual style.** If the user selected a style other
   than impeccable, the reviewer does **not** re-style to impeccable's taste — it
   only removes AI slop and fixes objective problems, keeping the chosen look.
4. It fixes what it finds, then re-verifies (`verification.md`) — screenshot,
   responsive, states. Loop until clean.

When impeccable is also the chosen style, this pass is impeccable iterating on
its own output — still run it; that's how craft gets sharp.

## 4. What counts as "AI slop"

Generic, soulless tells of AI-generated UI that the reviewer hunts down:

- Default purple/indigo gradients and unmodified component-library defaults
- Everything centered; no real visual hierarchy or focal point
- Inconsistent spacing that ignores a scale; misaligned edges
- Placeholder-grade copy ("Lorem ipsum", "Your text here", vague headings)
- Emoji used as feature icons; three generic "feature card" columns
- Weak contrast, muddy color, type with no scale or rhythm
- Over-rounded everything, drop shadows everywhere, no intent
- Motion that's either absent or gratuitous (see `emil-design-eng`)

A clean result looks **decided** — intentional hierarchy, real content shape,
consistent rhythm, and one clear primary action per screen.
