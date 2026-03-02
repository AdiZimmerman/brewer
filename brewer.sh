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

echo "[$(date '+%Y-%m-%d %H:%M:%S')] starting brewer"
"$BREW_BIN" update && "$BREW_BIN" upgrade
echo "[$(date '+%Y-%m-%d %H:%M:%S')] brewer completed"
