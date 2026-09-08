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

while IFS= read -r line; do
  line="$(echo "$line" | sed 's/#.*//' | xargs)"
  [ -z "$line" ] && continue
  echo "claude $line"
  claude $line || echo "  (skipped: exit $?)"
done < "$repo_root/claude/plugins.txt"
