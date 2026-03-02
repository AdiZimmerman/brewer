#!/bin/zsh
set -euo pipefail

# Include common Homebrew install locations for launchd environments.
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

if [[ -x /opt/homebrew/bin/brew ]]; then
  BREW_BIN="/opt/homebrew/bin/brew"
elif [[ -x /usr/local/bin/brew ]]; then
  BREW_BIN="/usr/local/bin/brew"
else
  BREW_BIN="$(command -v brew || true)"
fi

if [[ -z "${BREW_BIN:-}" ]]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] brew not found in PATH; skipping." >&2
  exit 1
fi

LOCK_DIR="${TMPDIR:-/tmp}/brewer.lock"
if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] another run is already in progress; exiting."
  exit 0
fi
trap 'rmdir "$LOCK_DIR" >/dev/null 2>&1 || true' EXIT

echo "[$(date '+%Y-%m-%d %H:%M:%S')] starting brewer maintenance"
"$BREW_BIN" update
"$BREW_BIN" upgrade
echo "[$(date '+%Y-%m-%d %H:%M:%S')] brewer maintenance completed"
