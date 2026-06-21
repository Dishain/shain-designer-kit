# Claude Designer Kit — your team inside Claude Code

Imagine a small product team appearing behind you: an analyst, a UX researcher, a UI designer, an accessibility specialist, a developer, a copywriter, and a tester. They don't argue, they don't break for lunch, and they work strictly by your rules. This kit turns Claude Code into exactly that team — and all you have to do is explain what you want to make.

It's for people who **design and build their own interfaces**, for vibe-coders, and for anyone who wants to get from an idea to a working product without disappearing into code.

---

## In a nutshell: how it works

1. **Download** the repository (the **Code → Download ZIP** button) and unzip it.
2. **Rename** the folder to your project's name — for example, `photo-portfolio`.
3. **Open** that folder in Claude Code (`claude .` in the terminal, or open the folder in the desktop app).
4. **Once**, run `./install.sh` — this pulls in the design skills.
5. **Describe** what you want: *"Build a landing page for my photography portfolio"* — and watch.

Claude reads the settings on its own, loads the rules, assembles the right specialists, drafts a plan, builds everything, and **checks its own work in a browser** before saying "done." Your job is to watch, steer, and make decisions — like an art director.

> No stack lock-in. React, Vue, Svelte, plain HTML — the kit adapts to whatever you work in.

---

## Why it's useful

Working with an AI assistant usually goes like this: you ask for something, you get a chunk of code, it doesn't run, you don't know why, and the conversation turns into ping-pong. This kit removes most of that pain:

- **It speaks design.** Not "implemented a useState hook," but "added a button in the top-right that lights up slightly on hover."
- **It thinks first, then builds.** Any non-trivial task starts with a plan you can adjust — not a wall of code up front.
- **It checks itself.** Before reporting back, Claude opens the page in a browser, takes a screenshot, and looks at the mobile and desktop views. You shouldn't be the first to discover something is broken.
- **It remembers your preferences.** Every time you correct it, it writes down the lesson — and doesn't repeat the same mistake next time.
- **It brings taste with it.** Inside is a large library of design skills: typography, color, grids, micro-animations, accessibility, design systems. It's not a bare assistant, but one with a trained eye.

---

## What's inside

### A team of 8 specialists (agents)

Each owns a part of the work. Claude decides who to bring in for your task and runs them **in parallel** where possible.

| Who | Owns |
|-----|------|
| 🧭 **BA (analyst)** | Breaks the idea down: what we're building, for whom, what's in the MVP, what comes later |
| 🔍 **UX Researcher** | User flows, navigation structure, wireframes, information architecture |
| 🎨 **UI Builder** | Visuals and build: components, color, typography, animations, Figma → code |
| 💅 **Design Reviewer** | After a page is built, removes "AI slop" and sharpens the craft (via the `impeccable` skill) |
| ♿ **Accessibility Auditor** | Checks accessibility: contrast, keyboard navigation, screen readers (WCAG AA) |
| ⚙️ **Developer** | Logic, data, forms, integrations, state, bug fixes |
| ✍️ **Copywriter** | Interface text: buttons, errors, hints, empty states |
| ✅ **Tester** | Visual QA, checks across all screens, user flows |

> Design-system work lives in the `shain-dls` skill, not a dedicated agent — more on skills below.

### A library of design skills

Skills are Claude's "trained eye": ready-made playbooks on specific topics. They're installed with `./install.sh` from vetted sources (not bundled into the repo, but pulled from the original "as is," with the source and license noted).

| Source | What it adds |
|--------|--------------|
| **impeccable** | `impeccable` — holistic interface taste: design, audit, critique, and polish, by Paul Bakaus |
| **anthropics/skills** | `frontend-design` — production-grade frontend from Anthropic |
| **ui-ux-pro-max** | 67 UI styles, palettes, font pairings, UX guidelines |
| **Owl-Listener/designer-skills** | ~95 skills: research, IA, UI, interaction, critique, design systems |
| **emilkowalski/skills** | `emil-design-eng` — micro-animations and the tasteful details, by Emil Kowalski |
| **Mindrally/skills** | `lottie` — performant Lottie animations on the web |
| **shain-dls** | Your skill for token-based design systems |

> Plus reference resources (not skills): a collection of brand `DESIGN.md` files (via `/use-design-md`) and a big list of real-world design systems for inspiration.

### Which style is used by default

To avoid a mush of ten skills at once, **one** style is chosen:

- **By default, the interface is built in the `impeccable` style** — a craft-focused skill with a trained eye that makes the result feel intentional rather than churned out.
- Want a different source of style? Just say so: *"use ui-ux-pro-max"*, *"follow our design system"* (`shain-dls`), or pull a brand's look with `/use-design-md`. Then the aesthetic comes from there.

### Multi-agent cleanup of "AI slop"

Here's the interesting part — it works like a team of two designers. When a page is ready, a **second agent, the Design Reviewer**, kicks in automatically:

1. It looks at the built page through the eyes of the `impeccable` skill.
2. It hunts for "AI slop" — the telltale signs of generated design: default purple gradients, everything centered with no hierarchy, ragged spacing, placeholder text, emoji used as icons, soulless "three feature columns."
3. It fixes what it finds — and **preserves your chosen style**: if you picked ui-ux-pro-max, it won't repaint everything to its own taste; it only removes the slop and objective mistakes.
4. It re-checks in the browser and repeats until it's clean.

So one agent builds in the chosen style and the other meticulously cleans up. The result looks **decided**, not assembled at random.

📌 **A core rule of the kit:** the moment it comes to building or polishing an interface, Claude **always** activates `emil-design-eng` — so micro-animations and interactions don't look slapped together.

### Rules (the team's character)

These are your team's "company culture" — Claude reads them at the start of every session:

- **workflow** — the order of work and who hands off to whom
- **design-skills-policy** — the default style, how to pick another, and the anti-slop pass
- **design-principles** — visual hierarchy, typography, color, spacing, responsive, motion
- **code-style** — clean code in any stack
- **verification** — the law of "don't report done without checking yourself"
- **skills** — how skills are updated and security-checked
- **updates** — how the kit keeps itself current
- **git-operations** — careful git handling (it never commits or pushes without your say-so)

### Quick commands

- **`/figma-to-code`** — turn a Figma design into working code
- **`/review-design`** — a full design review (UX + UI + accessibility + copy) with prioritized fixes
- **`/use-design-md`** — take a known brand's style (Linear, Vercel, Stripe…) and build UI "in that spirit"

---

## What working with it feels like: an example

You type:

> "Build a landing page for my photography portfolio. Minimalist, big photos, dark theme."

Here's what happens:

1. The **analyst** clarifies the picture: which sections you need (hero, gallery, about, contact), who the audience is, what's in version one.
2. **UX** proposes the structure and screen order — where things go and how a person moves through them.
3. **UI Builder** builds the real page in the default style (`impeccable`) or the one you chose: gallery grid, typography, dark palette, tidy hovers and micro-animations (via Emil's skill).
4. The **Design Reviewer** goes over the finished page, clears out "AI slop," and sharpens the craft.
5. In parallel, **accessibility** checks contrast and navigation, while the **copywriter** polishes the text.
6. The **tester** opens the result in a browser and looks at it on mobile and desktop.
7. Claude shows you a **screenshot** and tells you exactly what it checked.

You look and say: *"The photos are too close together, give them more air."* Claude fixes it and **checks again** — until it's right. And it remembers that you like more space between elements.

---

## Project memory: Claude learns from you

Inside is a simple but powerful thing — self-improvement between sessions:

- **`docs/todo.md`** — Claude writes the task plan here and tracks progress with checkboxes. You always see what's happening.
- **`docs/lessons.md`** — after each of your corrections, it records the lesson: what went wrong and the rule to follow now. This file lives between sessions, so over time Claude lands on your taste more and more precisely.

The longer you work, the less you have to repeat yourself.

---

## Why you won't get something broken

The main pain of working with AI is "here, it's done" — and it doesn't run. This kit bakes in a **law of self-verification**: Claude isn't allowed to say "done" without checking the result itself. For an interface that means:

1. Start and wait for the dev server (if it crashed — fix it).
2. Open the page in a browser.
3. Take a screenshot and look: are the elements in place, is the text readable, did anything fall apart?
4. Check the mobile (375px) and desktop (1440px) versions.
5. Click the buttons and forms.
6. Only then show you the result, with a screenshot.

If something's off, it fixes and re-checks, in a loop, until it works. You come in as the client, not the debugger.

---

## The kit keeps itself up to date

You downloaded the archive, renamed the folder, and moved on. Meanwhile the kit got better: new skills, smarter agents. So you don't get stuck on an old version, the kit **checks for updates itself**.

- At the start of a session, Claude quietly (no more than once a day) looks at the source repository. If a new version is out, it tells you in plain words and offers to update.
- If you agree, `./update.sh` runs. It updates **only the kit's files** (agents, rules, commands), and makes a backup first.
- Your work is safe: **your project, your text, your memory (`lessons.md`, `todo.md`), and your keys in `.mcp.json` are never touched.** If anything, the old files are in `.kit-backup/`.

So over time your "team" only gets stronger, and you don't have to do anything by hand.

---

## Full setup (optional — to unlock everything)

The kit works out of the box. To open up extra capabilities, you can add keys in `.mcp.json`:

| Integration | What it gives | Where to get the key |
|-------------|---------------|----------------------|
| **Figma** | Pull designs, tokens, and screenshots straight from Figma | Figma → Settings → Personal Access Tokens |
| **shadcn/ui** | A ready library of quality components | — |
| **Context7** | Up-to-date framework docs (instead of stale "from memory") | context7.com |
| **GitHub** | Working with repositories, PRs, issues | GitHub → Developer settings → Tokens |

And, once, install the design skills:

```bash
./install.sh
```

> `install.sh` pulls each skill at a pinned version, scans it for suspicious commands, and only then installs it. Details are in `.claude/skills/SOURCES.md`.

---

## FAQ

**Do I need to know how to code?**
No. It's enough to explain in words what you want and look at the result. Claude explains everything in plain language.

**Is this web-only?**
The kit is tuned for interfaces (React, Vue, Svelte, plain HTML), but it handles logic and integrations too — that's the Developer agent's job.

**What if I don't like the result?**
Just say so in plain words. Claude will fix it, re-check, and remember your preference for next time.

**Will it break my project or push without asking?**
No. By the kit's rules, Claude doesn't commit or push to git without your explicit command, and always shows changes first.

**Can I share it with designer friends?**
Yes. The kit itself is MIT-licensed. The bundled skills keep their authors' licenses — the kit doesn't resell them; it pulls them from the source.

---

## A few tips to start

- **Start small.** One page, one screen — get a feel for the rhythm.
- **Don't be afraid to correct.** Every correction makes Claude more precise for you.
- **Ask to see options.** "Show me 2–3 hero variants" works great.
- **Think like an art director.** Your strength is taste and decisions; the team takes the routine.

---

*A kit for designers who build. Download it, rename the folder to your project, open it — and let the team take the routine off your hands.*
