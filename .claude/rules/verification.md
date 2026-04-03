# Self-Verification Loop (MANDATORY)

## Core Rule

**NEVER report a task as complete without verifying it yourself.**

Do not say "Done" or "Ready" and hand it off to the user to check. You have browser tools, terminal access, and screenshot capabilities — use them. The user should see a working result, not discover that the server is down or the button is in the wrong place.

## Verification Steps for UI Work

After making any visual change (component, page, layout, style), you MUST:

### 1. Ensure the dev server is running
- Check if the dev server process is alive
- If not running or crashed — restart it yourself
- Wait until the server is ready (watch for the "ready" or "compiled" message)
- If the server fails to start, diagnose and fix the error before continuing

### 2. Open the page in a browser
- Use browser automation tools (Claude in Chrome, Playwright, or similar) to navigate to the relevant page
- If the page shows an error (blank screen, 500, hydration error) — fix it before continuing

### 3. Take a screenshot and visually verify
- Take a screenshot of the result
- Check that your changes are visible and correct:
  - Is the element in the right position?
  - Does the styling match what was requested?
  - Is the text readable?
  - Does it look broken or misaligned?
- If something looks wrong — fix it and verify again

### 4. Test responsive (when relevant)
- Check at least mobile (375px) and desktop (1440px)
- If layout breaks at any breakpoint — fix before reporting done

### 5. Test interaction (when relevant)
- Click buttons, submit forms, navigate links
- Verify that actions produce the expected result
- Check loading states and error states

### 6. Only then report as complete
- Show the user a screenshot or summary of what you verified
- Mention what you checked: "I verified the button appears correctly at the top-right, tested the click handler, and confirmed it works on mobile."

## Verification Steps for Bot Work

After making changes to a Telegram bot:

1. Start the bot process
2. Send test commands to verify responses
3. Test conversation flows end-to-end
4. Check error handling with invalid inputs
5. Only then report complete

## Verification Steps for Non-Visual Code

After making backend or logic changes:

1. Run the code / script
2. Verify output is correct
3. Run existing tests if available
4. Test edge cases
5. Only then report complete

## The Loop

If verification fails at any step:

```
Make change → Verify → Failed?
  → Fix → Verify again → Failed?
    → Fix → Verify again → ...
  → Passed? → Report complete
```

Keep looping until it actually works. Do not hand off broken work to the user.

## Anti-Patterns (NEVER DO)

- "I've added the button. Let me know if it looks right." — NO. Check it yourself.
- "The server should be running now." — NO. Verify it's running and the page loads.
- "I've fixed the CSS." — NO. Take a screenshot and confirm it's fixed.
- "Try refreshing the page." — NO. You refresh it and verify.
- Reporting 5 changes as done without checking any of them — NO. Verify each one.

## Tools Available for Verification

Use whatever tools are available in the current environment:
- **Browser automation** (Claude in Chrome, Playwright) — open pages, click, screenshot
- **Terminal** — run dev servers, curl endpoints, run tests
- **Screenshot tools** — capture and inspect visual output
- **Network/console tools** — check for errors, failed requests
