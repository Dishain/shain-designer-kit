#!/usr/bin/env bash
#
# Shain Designer Kit — self-update
#
# Updates ONLY the kit's own files in this project from the upstream repo.
# Your work, your project memory, and your API keys are never touched:
#   - docs/lessons.md, docs/todo.md  (project memory)
#   - .mcp.json                      (your API keys)
#   - .claude/settings.json          (your customizations)
#   - everything else in the folder  (your actual project)
#
# A timestamped backup of the replaced kit files is saved under .kit-backup/
# before anything is overwritten, so nothing is lost.
#
# Usage:
#   ./update.sh           # check, show what's new, ask before applying
#   ./update.sh --yes     # apply without prompting
#   ./update.sh --check   # only report whether an update exists
#
set -euo pipefail

REPO="Dishain/shain-designer-kit"
BRANCH="main"
RAW="https://raw.githubusercontent.com/$REPO/$BRANCH"
TARBALL="https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

MODE="ask"
case "${1:-}" in
  --yes|-y) MODE="yes" ;;
  --check)  MODE="check" ;;
esac

# Kit-owned paths that may be updated. Anything not listed here is left alone.
KIT_PATHS=(
  ".claude/agents"
  ".claude/rules"
  ".claude/commands"
  ".claude/scripts"
  ".claude/skills/SOURCES.md"
  "CLAUDE.md"
  "README.md"
  "GUIDE.md"
  "install.sh"
  "update.sh"
  "VERSION"
)

info() { printf '\033[1;34m→\033[0m %s\n' "$1"; }
ok()   { printf '\033[1;32m✓\033[0m %s\n' "$1"; }
warn() { printf '\033[1;33m!\033[0m %s\n' "$1"; }

ver_ge() { [[ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | tail -1)" == "$1" ]]; }

local_ver="$(cat VERSION 2>/dev/null | tr -d '[:space:]' || echo 0.0.0)"
remote_ver="$(curl -fsSL --max-time 10 "$RAW/VERSION" 2>/dev/null | tr -d '[:space:]' || true)"

if [[ -z "$remote_ver" ]]; then
  warn "Couldn't reach the kit repo (offline?). Skipping update."
  exit 0
fi

if [[ "$local_ver" == "$remote_ver" ]] || ver_ge "$local_ver" "$remote_ver"; then
  ok "Kit is up to date (v$local_ver)."
  exit 0
fi

info "Update available: v$local_ver → v$remote_ver"
[[ "$MODE" == "check" ]] && exit 10

if [[ "$MODE" == "ask" ]]; then
  read -r -p "Apply update now? Your work and memory are preserved. [Y/n] " ans
  [[ -z "$ans" || "$ans" =~ ^[Yy]$ ]] || { warn "Update cancelled."; exit 0; }
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

info "Downloading v$remote_ver…"
curl -fsSL --max-time 60 "$TARBALL" | tar -xzf - -C "$TMP"
SRC="$(find "$TMP" -mindepth 1 -maxdepth 1 -type d | head -1)"
[[ -d "$SRC" ]] || { warn "Download looked wrong — aborting, nothing changed."; exit 1; }

BACKUP=".kit-backup/v${local_ver}-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"

info "Backing up current kit files to $BACKUP/ …"
for p in "${KIT_PATHS[@]}"; do
  [[ -e "$p" ]] || continue
  mkdir -p "$BACKUP/$(dirname "$p")"
  cp -R "$p" "$BACKUP/$(dirname "$p")/"
done

info "Applying kit files…"
for p in "${KIT_PATHS[@]}"; do
  [[ -e "$SRC/$p" ]] || continue
  rm -rf "$p"
  mkdir -p "$(dirname "$p")"
  cp -R "$SRC/$p" "$(dirname "$p")/"
done

ok "Updated to v$remote_ver. Backup of the old kit files: $BACKUP/"

# .mcp.json / settings.json are intentionally NOT overwritten — flag drift instead.
if ! curl -fsSL --max-time 10 "$RAW/.mcp.json" 2>/dev/null | diff -q - .mcp.json >/dev/null 2>&1; then
  warn ".mcp.json differs from upstream (kept yours, with your API keys). Review it manually if new servers were added."
fi

echo
info "Re-running skill install in case pinned skill versions changed…"
if [[ -x ./install.sh ]]; then
  ./install.sh --yes || warn "Skill install reported issues — run ./install.sh manually to review."
fi

echo
ok "Done. Restart Claude Code to load the updated kit."
