# Review Design

Run a comprehensive design review on a page, component, or Figma file.

## Input

The user provides one of:
- A Figma link (file, frame, or component URL)
- A URL to a live page
- A screenshot
- A file path to local code

## Steps

### 1. Gather Context

**If Figma link:**
- Use `get_figma_data` to fetch design data
- Use `get_screenshot` to get visual reference

**If live URL:**
- Take screenshots at key breakpoints (mobile, tablet, desktop)
- Inspect the page structure

**If local code:**
- Read the component/page files
- Run locally if possible to get visual output

### 2. Dispatch Review Agents (in parallel)

**UX-Researcher Agent** — UX review:
- Is the user flow intuitive?
- Is the information hierarchy clear?
- Are there friction points?
- Is navigation logical?

**UI-Builder Agent** — Visual design review:
- Is the visual hierarchy effective?
- Are spacing and alignment consistent?
- Is the typography system coherent?
- Are colors used purposefully?
- Are interactive states defined?

**Accessibility-Auditor Agent** — A11y audit:
- Does it meet WCAG 2.1 AA?
- Are contrast ratios sufficient?
- Is it keyboard-navigable?
- Is semantic HTML used correctly?

**Copywriter Agent** — Copy review:
- Is the microcopy clear and helpful?
- Are button labels action-oriented?
- Are error messages user-friendly?
- Is the tone consistent?

### 3. Compile Review

Combine all findings into a single review report:

```
# Design Review: [Page/Component Name]

## Overall Score: [A / B / C / D]

## UX
[Key findings and recommendations]

## Visual Design
[Key findings and recommendations]

## Accessibility
[Critical / Major / Minor issues]

## Copy
[Key findings and recommendations]

## Priority Fixes
1. [Most impactful fix]
2. [Second most impactful]
3. [Third]

## What's Working Well
[Positive observations — always include these]
```

## Output

A structured design review with prioritized, actionable recommendations. Always include positive observations alongside areas for improvement.
