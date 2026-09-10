#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_skills="$repo_root/claude/skills"
target_root="$HOME/.claude/skills"
mkdir -p "$target_root"

for d in "$repo_skills"/*/; do
  name="$(basename "$d")"
  target="$target_root/$name"
  if [ -e "$target" ]; then
    echo "skip (already exists): $name"
  else
    ln -s "$d" "$target"
    echo "linked: $name"
  fi
done

nvim_target="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
mkdir -p "$(dirname "$nvim_target")"
if [ -e "$nvim_target" ]; then
  echo "skip (already exists): nvim"
else
  ln -s "$repo_root/nvim" "$nvim_target"
  echo "linked: nvim"
fi

while IFS= read -r line; do
  line="$(echo "$line" | sed 's/#.*//' | xargs)"
  [ -z "$line" ] && continue
  echo "claude $line"
  claude $line || echo "  (skipped: exit $?)"
done < "$repo_root/claude/plugins.txt"

# ponytail statusline badge
settings="$HOME/.claude/settings.json"
statusline_glob="$HOME/.claude/plugins/cache/ponytail/ponytail/*/hooks/ponytail-statusline.sh"
if ls -d $statusline_glob >/dev/null 2>&1; then
  [ -f "$settings" ] || echo '{}' > "$settings"
  tmp="$(mktemp)"
  jq --arg cmd 'bash $(ls -d $HOME/.claude/plugins/cache/ponytail/ponytail/*/hooks/ponytail-statusline.sh | sort -V | tail -1)' \
    '.statusLine = {type: "command", command: $cmd}' "$settings" > "$tmp" && mv "$tmp" "$settings"
  echo "statusline: ponytail"
else
  echo "statusline: skip (ponytail not installed)"
fi
