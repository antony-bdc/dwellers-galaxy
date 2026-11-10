#!/usr/bin/env bash
# safekeep post-hook: always re-enable autosave, even if the backup failed.
# Install: ln -s "$PWD/scripts/backup-hook-post.sh" /etc/safekeep/hooks/post.d/50-minecraft
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")/.."

if [[ -n "$(docker compose ps --status running -q mc)" ]]; then
  docker compose exec -T mc rcon-cli "save-on"
  echo "minecraft autosave resumed"
fi
