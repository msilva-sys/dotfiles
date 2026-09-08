#!/usr/bin/env bash
set -euo pipefail

repo_skills="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/claude/skills"
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
