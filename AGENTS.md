# AGENTS.md

## Scope
Applies to the entire repository rooted at `/Users/adizim/dev/brewer`.

## Project Overview
- `brewer` is the CLI entrypoint.
- `scripts/install-launchd-brewer.sh` installs the per-user LaunchAgent.
- `scripts/uninstall-launchd-brewer.sh` removes the per-user LaunchAgent.
- `scripts/brewer.sh` runs `brew update` and `brew upgrade`.

## Behavior Expectations
- Keep launchd label as `com.adizim.brewer` unless explicitly requested.
- Keep log path as `~/Library/Logs/brewer.log` unless explicitly requested.
- `brewer install` should:
  - attempt CLI symlink install to `/usr/local/bin/brewer`
  - continue with launchd setup if symlink install is not writable
  - skip launchd setup if plist already exists
- Do not add fallback PATH mutation logic unless explicitly requested.

## Editing Guidelines
- Prefer small, targeted shell-script changes.
- Keep scripts POSIX-ish with current zsh usage style.
- Preserve idempotency for install/uninstall flows.
- Avoid introducing background daemons beyond launchd.

## Validation
- Run syntax checks after script edits:
  - `zsh -n brewer`
  - `zsh -n scripts/brewer.sh`
  - `zsh -n scripts/install-launchd-brewer.sh`
  - `zsh -n scripts/uninstall-launchd-brewer.sh`
- If CLI path logic changes, test both:
  - `./brewer help`
  - `/usr/local/bin/brewer help` (when symlink exists)
