#!/usr/bin/env bash
#
# SessionStart bootstrap for the Shain Designer Kit.
#
# The user never has to run a command. On the first session this:
#   1. installs the design skills in the BACKGROUND (so the session doesn't wait), and
#   2. checks for kit updates (best-effort, silent if up to date or offline).
#
# Skills land in ~/.claude/skills/. install.sh writes the marker on success, so
# this runs the install only once.
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." 2>/dev/null && pwd)" || exit 0
cd "$ROOT" 2>/dev/null || exit 0

SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
MARKER="$SKILLS_DIR/.shain-kit-installed"
LOCK="$ROOT/.claude/.installing"
now="$(date +%s)"

# 1) First-run skill install — kick off once, in the background.
if [[ ! -f "$MARKER" ]]; then
  fresh=1
  if [[ -f "$LOCK" ]]; then
    last="$(cat "$LOCK" 2>/dev/null || echo 0)"
    [[ "$last" =~ ^[0-9]+$ ]] && (( now - last < 900 )) && fresh=0   # an install is already running
  fi
  if [[ "$fresh" -eq 1 && -x "$ROOT/install.sh" ]]; then
    echo "$now" > "$LOCK" 2>/dev/null || true
    nohup bash "$ROOT/install.sh" --yes >"$ROOT/.claude/.install.log" 2>&1 &
    echo "SHAIN_KIT_INSTALLING: First-run setup — design skills are installing in the background (one-time, ~1 min). Tell the user briefly. If a design skill isn't available yet, wait ~30s and retry; progress is in .claude/.install.log."
  fi
fi

# 2) Daily kit update check (best-effort).
[[ -x "$ROOT/.claude/scripts/check-update.sh" ]] && bash "$ROOT/.claude/scripts/check-update.sh" || true
exit 0
