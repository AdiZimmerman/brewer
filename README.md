# brewer

`brewer` is a small macOS CLI that keeps Homebrew packages updated with a per-user `launchd` job.

## What it does

- Installs LaunchAgent `com.adizim.brewer`
- Writes plist to `~/Library/LaunchAgents/com.adizim.brewer.plist`
- Logs to `~/Library/Logs/brewer.log`
- Runs `brewer.sh`, which executes `brew update` and `brew upgrade`

The agent runs at load/login and then every 24 hours (`StartInterval=86400`).

## Commands

Run from this repo:

```sh
./brewer install
./brewer uninstall
./brewer run
./brewer status
./brewer logs
./brewer help
```

### install

- If plist is missing: install and load LaunchAgent.
- If plist exists and points to this repo's runner: skip.
- If plist exists but points elsewhere: refresh setup.

### uninstall

Unloads the job (if loaded) and removes the plist.

### run

Runs `brewer.sh` once and appends output to `~/Library/Logs/brewer.log`.

### status

Shows plist presence, launchd loaded state, and log path.

### logs

Tails `~/Library/Logs/brewer.log`.

## Requirements

- macOS
- Homebrew installed
- `zsh`
