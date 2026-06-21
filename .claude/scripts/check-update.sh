#!/usr/bin/env bash
#
# SessionStart check: is a newer version of the Claude Designer Kit available?
#
# Fast, silent, and fail-safe — if there's no network or no VERSION file, it
# exits quietly without slowing down the session. It only PRINTS a notice; it
# never modifies files. Applying the update is done by ./update.sh on request.
#
# Checks at most once per day (cached in .claude/.update-check).
#
set -euo pipefail

REPO="Dishain/claude-designer-kit"
BRANCH="main"
RAW="https://raw.githubusercontent.com/$REPO/$BRANCH"

# project root = two levels up from .claude/scripts/
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." 2>/dev/null && pwd)" || exit 0
cd "$ROOT" 2>/dev/null || exit 0

CACHE=".claude/.update-check"
now="$(date +%s)"
if [[ -f "$CACHE" ]]; then
  last="$(cat "$CACHE" 2>/dev/null || echo 0)"
  [[ "$last" =~ ^[0-9]+$ ]] && (( now - last < 86400 )) && exit 0
fi
echo "$now" > "$CACHE" 2>/dev/null || true

local_ver="$(cat VERSION 2>/dev/null | tr -d '[:space:]' || echo 0.0.0)"
remote_ver="$(curl -fsSL --max-time 3 "$RAW/VERSION" 2>/dev/null | tr -d '[:space:]')" || exit 0
[[ -z "$remote_ver" || "$remote_ver" == "$local_ver" ]] && exit 0

# announce only when remote is strictly newer
newest="$(printf '%s\n%s\n' "$local_ver" "$remote_ver" | sort -V | tail -1)"
if [[ "$newest" == "$remote_ver" ]]; then
  echo "KIT_UPDATE_AVAILABLE: Claude Designer Kit v$local_ver → v$remote_ver. Tell the user an update is available and offer to run ./update.sh (their work and project memory are preserved). See .claude/rules/updates.md."
fi
exit 0
