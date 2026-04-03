# Code Style (Multi-Stack)

## General Principles

This project is **stack-agnostic**. The user may work with React, Vue, Svelte, vanilla HTML/CSS/JS, Python, or anything else. Adapt to whatever stack is in use.

## Universal Rules

- Write clean, readable code with descriptive names
- Prefer small functions/components over large monolithic ones
- Comment "why", not "what" — code should be self-documenting
- No hardcoded values — use variables, constants, or tokens
- Consistent file naming within the project (detect and follow existing conventions)

## Frontend (when applicable)

- **CSS**: Prefer utility-first (Tailwind) or CSS Modules over global styles
- **Components**: One component per file, named clearly
- **State**: Keep state as close to where it's used as possible
- **Imports**: Group and order imports consistently (framework → libraries → local)
- **Accessibility**: Semantic HTML first, ARIA only when needed

## React (when detected)

- Functional components with hooks
- Props destructuring in function signature
- Custom hooks for reusable logic (`use*` prefix)
- Prefer `const` arrow functions for components

## Vue (when detected)

- Composition API with `<script setup>`
- `defineProps` and `defineEmits` for component API
- `ref()` for primitives, `reactive()` for objects
- Composables for reusable logic (`use*` prefix)

## Svelte (when detected)

- `$state` and `$derived` runes (Svelte 5)
- Component props via `$props`
- Keep logic in `.svelte` files, extract utilities to `.js`/`.ts`

## Python (when detected — Telegram bots, scripts, etc.)

- Follow PEP 8
- Type hints for function parameters and returns
- Async/await for I/O operations (especially Telegram bots)
- Docstrings for public functions and classes
- Use `f-strings` for string formatting

## HTML/CSS (vanilla)

- Semantic HTML5 elements (`<nav>`, `<main>`, `<section>`, `<article>`)
- BEM or similar naming convention for CSS classes
- CSS custom properties for theming (`--color-primary`, `--spacing-md`)
- Mobile-first media queries

## Code Quality

- No `console.log` / `print()` left in production code
- No commented-out code blocks
- No unused imports or variables
- No magic numbers — use named constants
