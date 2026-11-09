#!/usr/bin/env bash
# backup-toolkit pre-hook: flush the world to disk and pause autosave,
# so restic copies a consistent world instead of half-written region files.
# Install: ln -s "$PWD/scripts/backup-hook-pre.sh" /etc/backup-toolkit/hooks/pre.d/50-minecraft
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")/.."

if [[ -z "$(docker compose ps --status running -q mc)" ]]; then
  echo "minecraft not running, nothing to pause"
  exit 0
fi
docker compose exec -T mc rcon-cli "save-off"
docker compose exec -T mc rcon-cli "save-all flush"
# save-all returns before the last chunks hit the disk on slow storage.
sleep 5
echo "minecraft autosave paused"
