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
cd /Users/adizim/dev/brewer
./brewer install
```

`install` does two things:

- installs CLI at `/usr/local/bin/brewer`
- installs launchd job if missing (`~/Library/LaunchAgents/com.adizim.brewer.plist`)

If `/usr/local/bin` is not writable, `install` prints a warning with a `sudo ln -sf ...` command and continues with launchd setup.
If launchd is already installed, `install` skips launchd setup.

## Commands

From repo root:

```sh
./brewer install
./brewer run
./brewer status
./brewer logs
./brewer uninstall
```

From anywhere (after install):

```sh
brewer install
brewer run
brewer status
brewer logs
brewer uninstall
```

## Logs

`~/Library/Logs/brewer.log`
