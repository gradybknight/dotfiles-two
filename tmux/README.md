# tmux config

Linked to `~/.config/tmux` by `../install.sh`. Prefix is `Ctrl-A`.

- `tmux.conf` — main config: Catppuccin Mocha status bar, plugin list (`@plugin` lines).
- `tmux.reset.conf` — key bindings (sourced first).
- `gitmux.conf` — Catppuccin theme for the `gitmux` status module; linked to `~/.gitmux.conf`.

## Plugins

Managed by [TPM](https://github.com/tmux-plugins/tpm); `plugins/` is gitignored.
`install.sh` clones every `@plugin` from `tmux.conf` into `plugins/` directly.
Inside tmux:

- `Ctrl-A` + `I` — install plugins listed in `tmux.conf`
- `Ctrl-A` + `U` — update them
- `Ctrl-A` + `R` — reload the config
