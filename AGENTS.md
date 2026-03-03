# AGENTS.md

## Scope
Applies to the whole repo.

## Repo map
- `brewer`: CLI entrypoint
- `brewer.sh`: runs `brew update` and `brew upgrade`
- `install-launchd-brewer.sh`: installs per-user LaunchAgent
- `uninstall-launchd-brewer.sh`: removes per-user LaunchAgent

## Required behavior
- Keep launchd label as `com.adizim.brewer` unless explicitly requested.
- Keep log path as `~/Library/Logs/brewer.log` unless explicitly requested.
- `brewer install` must skip launchd setup if plist already exists.

## Editing rules
- Prefer small, targeted shell-script changes.
- Keep scripts POSIX-ish with current zsh style.
- Preserve idempotent install/uninstall flows.
- Do not add daemons beyond launchd.

## Validation
After script edits, run:
- `zsh -n brewer`
- `zsh -n brewer.sh`
- `zsh -n install-launchd-brewer.sh`
- `zsh -n uninstall-launchd-brewer.sh`
