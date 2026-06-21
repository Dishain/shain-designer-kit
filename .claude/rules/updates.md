# Kit Updates

This project was created from the **Shain Designer Kit**. The kit evolves over
time, and projects are often started from a downloaded archive — so the kit
files here can fall behind the upstream repo.

## At session start

A `SessionStart` hook runs `.claude/scripts/bootstrap.sh`, which installs the
design skills on first run and quietly checks the upstream repo
(`Dishain/shain-designer-kit`) for kit updates at most once per day.

- If you see a line beginning with **`KIT_UPDATE_AVAILABLE:`** in the session
  context, tell the user — in plain, friendly language — that a newer version of
  the kit is available, and offer to update.
- Do **not** silently overwrite files. Updating changes the kit's agents and
  rules, so the user should agree first.
- If there's no such line, say nothing about updates — just continue.

## Applying an update

Run `./update.sh` (or `./update.sh --yes` if the user says go ahead). It:

1. Downloads the latest kit version.
2. Backs up the current kit files to `.kit-backup/` first.
3. Replaces **only kit-owned files** — agents, rules, commands, scripts,
   `CLAUDE.md`, `README.md`, `GUIDE.md`, `install.sh`, `VERSION`.
4. **Never touches** the user's work, their project memory
   (`docs/lessons.md`, `docs/todo.md`), their API keys (`.mcp.json`), or their
   `.claude/settings.json`.
5. Re-runs `./install.sh` in case pinned skill versions changed.

After updating, briefly summarize what changed (read the new `VERSION` and, if
helpful, the README), then continue the user's actual task.

## Notes

- The check is best-effort: offline or rate-limited checks fail silently and
  never block work.
- Updates preserve everything the user has done. If they ever want the old kit
  files back, they're in `.kit-backup/`.
