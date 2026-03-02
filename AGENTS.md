# AGENTS.md

## Scope
Applies to the entire repository.

## Project Overview
- `brewer` is the CLI entrypoint.
- `install-launchd-brewer.sh` installs the per-user LaunchAgent.
- `uninstall-launchd-brewer.sh` removes the per-user LaunchAgent.
- `brewer.sh` runs `brew update` and `brew upgrade`.

## Behavior Expectations
- Keep launchd label as `com.adizim.brewer` unless explicitly requested.
- Keep log path as `~/Library/Logs/brewer.log` unless explicitly requested.
- `brewer install` should:
  - skip launchd setup if plist already exists

## Editing Guidelines
- Prefer small, targeted shell-script changes.
- Keep scripts POSIX-ish with current zsh usage style.
- Preserve idempotency for install/uninstall flows.
- Avoid introducing background daemons beyond launchd.

## Validation
- Run syntax checks after script edits:
  - `zsh -n brewer`
  - `zsh -n brewer.sh`
  - `zsh -n install-launchd-brewer.sh`
  - `zsh -n uninstall-launchd-brewer.sh`
