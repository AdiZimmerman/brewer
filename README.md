# brewer

`brewer` is a small macOS CLI that manages a per-user `launchd` job to keep Homebrew packages up to date.

The scheduled job runs:
- `brew upgrade`

## What It Installs

- LaunchAgent label: `com.adizim.brewer`
- Plist path: `~/Library/LaunchAgents/com.adizim.brewer.plist`
- Log path: `~/Library/Logs/brewer.log`
- Runner script: `brewer.sh`

## Schedule

The LaunchAgent is configured to:
- run at login/load (`RunAtLoad`)
- run every 24 hours (`StartInterval = 86400`)
- catch up after wake if an interval was missed (launchd behavior)

## Commands

Run from the repository root:

```sh
./brewer install
./brewer uninstall
./brewer run
./brewer status
./brewer logs
./brewer help
```

### `install`

- Installs launchd setup if the plist is missing.
- If the plist exists and already points to this repo's `brewer.sh`, install is skipped.
- If the plist exists but points to an outdated runner path, install is re-run to refresh it.

### `uninstall`

- Unloads the launchd job (if loaded)
- Removes `~/Library/LaunchAgents/com.adizim.brewer.plist`

### `run`

Runs maintenance immediately once:
- executes `brewer.sh`
- appends output to `~/Library/Logs/brewer.log`
- exits with the same status as the maintenance script

### `status`

Shows:
- plist presence
- launchd loaded state for `gui/<uid>/com.adizim.brewer`
- log file path

### `logs`

- Tails the log file.

## Requirements

- macOS (uses per-user `launchd` / `launchctl`)
- Homebrew installed (`brew` must be discoverable)
- `zsh`

`brewer.sh` checks common Homebrew locations first:
- `/opt/homebrew/bin/brew`
- `/usr/local/bin/brew`

## Repo Files

- `brewer`: CLI entrypoint
- `brewer.sh`: one-shot maintenance runner
- `install-launchd-brewer.sh`: writes and loads LaunchAgent
- `uninstall-launchd-brewer.sh`: unloads and removes LaunchAgent
