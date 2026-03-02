# Brewer launchd maintenance utility

This utility installs a per-user `launchd` job that runs:

- `brew update`
- `brew upgrade`

Schedule behavior:

- runs on job load (typically at login)
- runs every 24 hours (`StartInterval = 86400`)
- if a run is missed during sleep, `launchd` runs the job soon after wake

## Install (launchd job)

```sh
./scripts/install-launchd-brewer.sh
```

## Uninstall

```sh
./scripts/uninstall-launchd-brewer.sh
```

## Logs

`~/Library/Logs/brewer.log`

## `brewer` CLI

This repo now includes a command entrypoint: [`brewer`](/Users/adizim/dev/brewer/brewer)

From repo root:

```sh
./brewer install
./brewer status
./brewer logs
./brewer uninstall
```

`./brewer install` installs the command at `/usr/local/bin/brewer`.
If that location is not writable for your user, the command exits with an error.
If launchd is already installed, `./brewer install` skips launchd setup.
