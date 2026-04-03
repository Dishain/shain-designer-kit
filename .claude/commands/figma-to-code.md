# Figma to Code

Convert a Figma design into working code.

## Input

The user provides a Figma link (file, frame, or component URL).

## Steps

### 1. Fetch Design Data

Use Figma MCP tools to get design information:
- `get_figma_data` — layout structure, components, properties
- `get_screenshot` — visual reference
- `get_design_context` — detailed component specs
- `get_variable_defs` — design tokens and variables
- `get_styles` — colors, typography, effects

### 2. Analyze Design

Extract from the Figma data:
- **Layout**: auto-layout direction, spacing, padding → flexbox/grid
- **Colors**: fill colors → CSS variables or Tailwind classes
- **Typography**: font family, size, weight, line-height → type tokens
- **Spacing**: gaps and padding → spacing tokens
- **Components**: identify reusable patterns
- **States**: check for component variants (hover, active, disabled)
- **Responsive**: check for different frame sizes

### 3. Detect Stack

Check the project for existing stack:
- `package.json` → React, Vue, Svelte, Next.js, Nuxt, SvelteKit
- `tailwind.config.*` → Tailwind CSS
- `tsconfig.json` → TypeScript
- If no project exists → ask user preference, default to React + Tailwind

### 4. Dispatch Agents

1. **UI-Builder Agent**: Build the components and pages matching Figma
2. **Accessibility-Auditor Agent**: Verify the implementation meets WCAG AA
3. **Developer Agent**: Wire up any interactive logic (forms, navigation, state)

### 5. Verify

- Compare screenshot of implementation against Figma screenshot
- Check responsive behavior
- Verify all component states work

## Output

Working code files that match the Figma design, with:
- Correct layout, colors, typography, spacing
- Responsive behavior
- Interactive states (hover, focus, etc.)
- Semantic HTML and accessibility basics
