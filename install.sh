#!/usr/bin/env bash
#
# Claude Designer Kit — skill installer
#
# Installs the kit's design skills from PINNED upstream commits into
# ~/.claude/skills/. Nothing is vendored into this repo: every skill is fetched
# from its source at install time, scanned for risky patterns, and only then
# copied into place. See .claude/skills/SOURCES.md for the manifest and
# .claude/rules/skills.md for the update + security policy.
#
# Usage:
#   ./install.sh            # interactive: pause on any security findings
#   ./install.sh --yes      # non-interactive: install without prompting
#   CLAUDE_SKILLS_DIR=/custom/path ./install.sh
#
set -euo pipefail

SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
ASSUME_YES=0
[[ "${1:-}" == "--yes" || "${1:-}" == "-y" ]] && ASSUME_YES=1

# repo|pinned_commit|source_subpath_in_repo|destination_name
SKILLS=(
  "anthropics/skills|57546260929473d4e0d1c1bb75297be2fdfa1949|skills/frontend-design|frontend-design"
  "nextlevelbuilder/ui-ux-pro-max-skill|7538cfb3604c83b0eb5ab570a6375ba9acd6507a|.|ui-ux-pro-max"
  "Owl-Listener/designer-skills|acc3e574b36ef2895268a176dbae886e1b845ae0|.|designer-skills"
  "emilkowalski/skills|43d8284140edf1301a3a0a781b86c83200857080|skills/emil-design-eng|emil-design-eng"
  "emilkowalski/skills|43d8284140edf1301a3a0a781b86c83200857080|skills/review-animations|review-animations"
  "Dishain/Shain-Design-System-Skill|9675ea2a1d2034846b61b03a39b618c77fb2430c|.|shain-dls"
)

# Patterns that warrant a human look before trusting a third-party skill.
RISKY='curl |wget |rm -rf|sudo |eval |base64 -d|base64 --decode|Invoke-Expression|iex |nc -|/dev/tcp|chmod \+x|ssh |\$\(curl|\$\(wget'

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

info()  { printf '\033[1;34m→\033[0m %s\n' "$1"; }
warn()  { printf '\033[1;33m!\033[0m %s\n' "$1"; }
ok()    { printf '\033[1;32m✓\033[0m %s\n' "$1"; }

security_scan() {
  local dir="$1" name="$2" hits
  hits="$(grep -rInE "$RISKY" "$dir" 2>/dev/null | grep -viE '/(node_modules|\.git)/' || true)"
  if [[ -n "$hits" ]]; then
    warn "Security review — '$name' contains patterns worth checking:"
    echo "$hits" | sed 's/^/    /' | head -40
    if [[ "$ASSUME_YES" -eq 0 ]]; then
      read -r -p "    Install '$name' anyway? [y/N] " ans
      [[ "$ans" =~ ^[Yy]$ ]] || { warn "Skipped '$name'."; return 1; }
    fi
  fi
  return 0
}

mkdir -p "$SKILLS_DIR"
info "Installing design skills into: $SKILLS_DIR"
echo

for entry in "${SKILLS[@]}"; do
  IFS='|' read -r repo sha src dest <<<"$entry"
  sha="${sha// /}"   # tolerate accidental spaces in the pinned sha
  work="$TMP/$dest"
  info "$dest  ($repo @ ${sha:0:7})"

  git clone -q --filter=blob:none "https://github.com/$repo" "$work"
  git -C "$work" checkout -q "$sha"

  if [[ ! -e "$work/$src" ]]; then
    warn "Source path '$src' not found in $repo — skipping '$dest'."
    continue
  fi

  security_scan "$work/$src" "$dest" || continue

  rm -rf "${SKILLS_DIR:?}/$dest"
  mkdir -p "$SKILLS_DIR/$dest"
  # copy contents of the source path, excluding VCS metadata
  ( cd "$work/$src" && tar --exclude='./.git' -cf - . ) | ( cd "$SKILLS_DIR/$dest" && tar -xf - )
  ok "Installed $dest"
done

echo
ok "Done. Restart Claude Code (or reload skills) to pick up the new skills."
echo "Manifest: .claude/skills/SOURCES.md   Policy: .claude/rules/skills.md"
