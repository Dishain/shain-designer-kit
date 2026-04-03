# Design Principles

## Visual Hierarchy

- Every screen must have a clear primary action
- Use size, weight, and color to guide the eye: heading → subheading → body → caption
- Limit to 2–3 levels of visual emphasis per screen
- White space is a feature, not wasted space

## Typography

- Use a maximum of 2 font families (1 for headings, 1 for body)
- Establish a type scale and stick to it (e.g., 12, 14, 16, 20, 24, 32, 40)
- Line height: 1.4–1.6 for body text, 1.1–1.3 for headings
- Never use font-size below 14px for body text on web

## Color

- Define a palette: primary, secondary, neutral, success, warning, error
- Use color intentionally — every color should have a purpose
- Ensure contrast ratios: 4.5:1 for normal text, 3:1 for large text (WCAG AA)
- Don't rely on color alone to convey information (use icons, labels, patterns)

## Spacing & Layout

- Use a consistent spacing scale (4, 8, 12, 16, 24, 32, 48, 64)
- Apply the 8px grid for alignment
- Maintain consistent padding within similar components
- Group related elements with proximity, separate unrelated with space

## Responsive Design

- Design mobile-first, then scale up
- Key breakpoints: 320px (mobile), 768px (tablet), 1024px (desktop), 1440px (wide)
- Touch targets: minimum 44x44px on mobile
- Test every layout at all breakpoints before shipping

## Component Design

- Components should be self-contained and reusable
- Every interactive element needs: default, hover, active, focus, disabled states
- Use consistent border-radius, shadows, and transitions across the project
- Prefer composition over configuration (small components that combine)

## Motion & Animation

- Use animation purposefully — to guide attention or provide feedback
- Keep durations short: 150–300ms for micro-interactions, 300–500ms for transitions
- Prefer ease-out for entrances, ease-in for exits
- Respect `prefers-reduced-motion` — always provide a reduced-motion alternative

## Content & UX Writing

- Button labels should be verbs: "Save", "Send", "Create" — not "OK" or "Submit"
- Error messages should explain what happened AND what to do next
- Empty states should guide the user toward action
- Be concise: if you can say it in 3 words, don't use 10

## Icons & Imagery

- Use a single icon set consistently (Lucide, Heroicons, Phosphor, etc.)
- Icons should have text labels when the meaning isn't universally obvious
- Size icons consistently: 16px inline, 20px in buttons, 24px standalone
- Decorative images need empty alt text; meaningful images need descriptive alt text
