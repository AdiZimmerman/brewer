# Brewer

`brewer` installs a per-user macOS `launchd` job that runs:

- `brew update`
- `brew upgrade`

Schedule:

- on load/login (`RunAtLoad`)
- every 24 hours (`StartInterval = 86400`)
- after wake if a scheduled interval was missed

## Quick Start

After cloning:

```sh
cd brewer
./brewer install
```

`install`:

- installs launchd job if missing (`~/Library/LaunchAgents/com.adizim.brewer.plist`)

If launchd is already installed, `install` skips setup unless the runner path is outdated, in which case it reinstalls.

## Commands

From repo root:

```sh
./brewer install
./brewer run
./brewer status
./brewer logs
./brewer uninstall
```

## Logs

`~/Library/Logs/brewer.log`

Both launchd runs and `brewer run` append to this log.
