# Agent Workflow Orchestration

## Workflow Orchestration

### 1. General Rules
- Enter **plan mode** for ANY non-trivial task (3+ steps or design decisions)
- If something goes sideways, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity
- Never mark a task complete without proving it works
- **Explain everything in designer-friendly language** — avoid jargon unless the user uses it first

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One task per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction from the user: update `./docs/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

### 4. Verification Before Done (CRITICAL — see rules/verification.md)
- **NEVER report done without self-verifying** — use browser, terminal, screenshots
- For UI work: start the dev server, open the browser, take a screenshot, confirm visually
- For code: run it, check output, run tests
- If verification fails → fix → verify again → loop until it works
- Ask yourself: "Would a senior designer approve this?"
- The user should NEVER be the one discovering that something is broken

### 5. Demand Elegance (Balanced)
- For UI work: pause and ask "is this visually polished enough?"
- For code: "is this the simplest way to achieve the result?"
- Skip over-engineering for simple, obvious tasks
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at the issue, explain what happened simply, then resolve
- Zero context switching required from the user

## Task Management

1. **Plan First**: Write plan to `./docs/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step in plain language
5. **Document Results**: Add review section to `./docs/todo.md`

## Core Principles

- **Designer First**: Speak in design terms. Visual outcomes over implementation details.
- **Simplicity First**: Make every change as simple as possible. Minimal code, maximum result.
- **Show, Don't Tell**: Create working prototypes instead of long explanations.
- **No Stack Lock-in**: Works with any frontend stack.

## Standard Feature Pipeline

Use this pipeline when the task meets **ANY** of the following criteria:
- Creates a new page, screen, or view
- Requires user interface design decisions
- Adds or changes interactive components
- Involves user flows or navigation
- Touches more than 2 files

If none apply (e.g. fixing a typo, updating a config value) — skip the pipeline.

Follow this agent pipeline in order:

### Step 1: Analysis (BA Agent)
- Analyze the task requirements
- Break down into user stories with acceptance criteria
- Identify target audience, use cases, and constraints
- Output: clear requirements, scope definition, implementation roadmap

### Step 2: UX Research (UX-Researcher Agent)
- Define user flows and information architecture
- Identify pain points and UX patterns to apply
- Propose wireframe-level structure
- Output: user flows, IA decisions, wireframe recommendations

### Step 3: UI Design & Build (UI-Builder Agent)
- Design visual interface based on UX research
- Build in the **active style skill** — `impeccable` by default, or whatever the
  user selected (see `.claude/rules/design-skills-policy.md`). Pick one style source.
- Choose components, colors, typography, spacing
- Build working UI using appropriate framework
- **Whenever building or refining an interface, activate the `emil-design-eng` skill** for micro-animations and interaction polish (and `review-animations` when reviewing existing motion)
- Output: working UI components / pages

### Step 3b: Design Review & Anti-Slop (Design-Reviewer Agent) — runs after each page
- Activate the `impeccable` skill and audit the built page for AI slop + craft issues
- **Respect the chosen visual style** — only remove slop and fix objective problems; don't re-style to impeccable's taste when another style was selected
- Fix, then self-verify (screenshot, responsive, states); loop until clean
- Output: a sharpened page + before/after summary

### Step 4: Accessibility Audit (Accessibility-Auditor Agent)
- Audit UI for WCAG 2.1 AA compliance
- Check color contrast, keyboard navigation, screen reader support
- Verify semantic HTML and ARIA usage
- Output: accessibility findings with severity ratings and fixes

### Step 5: Code Implementation (Developer Agent)
- Implement business logic, API integrations, data flows
- Connect UI to backend / data sources
- Handle state management, routing, error handling
- Output: working feature code

### Step 6: Testing (Tester Agent)
- Write and run tests for critical user flows
- Verify responsive behavior across breakpoints
- Check cross-browser compatibility
- Output: test results, coverage report

## Parallel Execution

After UI-Builder completes a page:
- **Design-Reviewer** runs the impeccable anti-slop pass on that page
- **Accessibility Auditor** + **Copywriter** can run simultaneously with it
- **Developer** starts after UI-Builder, doesn't need to wait for A11y Auditor
- A11y and anti-slop fixes are reconciled after Developer completes

## Design-Only Pipeline

For tasks that are purely design (no code needed):
1. **BA Agent** — requirements
2. **UX-Researcher** — user flows, wireframes
3. **UI-Builder** — visual design, mockups (in the active style skill)
4. **Design-Reviewer** — impeccable anti-slop pass
5. **Accessibility-Auditor** — compliance check

## Bug Fix Pipeline (Simplified)

1. **Developer Agent** — investigate + fix
2. **Tester Agent** — verify fix works
