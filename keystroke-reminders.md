# TMUX

Status bar (top): left = session name + window pills (active in mauve);
right = git state (gitmux) · directory · date/time.

| -Action-                  | -Keystroke- |
| ------------------------- | ----------- |
| Enter command prompt      | Ctrl-A + :  |
| Choose session            | Ctrl-A + S  |
| List windows              | Ctrl-A + w  |
| Choose window             | Ctrl-A + "  |
| New window                | Ctrl-A + Ctrl-C |
| Rename window             | Ctrl-A + m  |
| Kill session              | Ctrl-A + K  |
| Kill pane                 | Ctrl-A + x  |
| Split pane horizontally   | Ctrl-A + v  |
| Split pane vertically     | Ctrl-A + s  |
| Fullscreen/Zoom pane      | Ctrl-A + z  |
| Previous window           | Ctrl-A + H  |
| Next window               | Ctrl-A + L  |
| Reload config             | Ctrl-A + R  |
| Last window               | Ctrl-A + Ctrl-A |
| Detach                    | Ctrl-A + Ctrl-D |
| Resize pane left          | Ctrl-A + ,  |
| Resize pane right         | Ctrl-A + .  |
| Resize pane down          | Ctrl-A + -  |
| Resize pane up            | Ctrl-A + =  |
| Select pane left          | Ctrl-A + h  |
| Select pane down          | Ctrl-A + j  |
| Select pane up            | Ctrl-A + k  |
| Select pane right         | Ctrl-A + l  |
| Toggle synchronize-panes  | Ctrl-A + *  |
| Toggle pane border status | Ctrl-A + P  |
| Floating terminal (Floax) | Ctrl-A + p  |
| Open sessionx menu        | Ctrl-A + o  |

# NEOVIM LSP

| -Action-                        | -Keystroke-   |
| ------------------------------- | ------------- |
| Show line diagnostics           | Space + d     |
| Show all buffer diagnostics     | Space + D     |
| Go to next diagnostic           | ]d            |
| Go to previous diagnostic       | [d            |
| Show hover documentation        | K             |
| Show LSP references             | gR            |
| Go to declaration               | gD            |
| Show LSP definitions            | gd            |
| Show LSP implementations        | gi            |
| Show LSP type definitions       | gt            |
| See available code actions      | Space + ca    |
| Smart rename                    | Space + rn    |
| Restart LSP                     | Space + rs    |
| Toggle inlay hints              | Space + ih    |

# ZSH (shell)

The prompt shows: `path  branch <state>` on line 1, `❯` on line 2 (red on error).
State markers: `+` staged · `!` modified · `?` untracked · `⇡/⇣` ahead/behind.

| -Action-                              | -Keystroke- |
| ------------------------------------- | ----------- |
| Fuzzy history search (fzf)            | Ctrl-R      |
| Insert file path (fzf)                | Ctrl-T      |
| cd into subdirectory (fzf)            | Alt-C       |
| History search by current prefix      | Up / Down   |
| Move by word                          | Ctrl-← / Ctrl-→ |

| -Shortcut-                | -Does- |
| ------------------------- | ------ |
| `<dir>`                   | cd into it (AUTO_CD) |
| `cd <repo>`               | resolves via `~/git` from anywhere (cdpath) |
| `cd -`                    | previous directory |
| `..` / `...`              | up one / up two |
| `d`                       | list the directory stack |
| `1`..`9`                  | jump to that entry in the stack |
| `z <name>` / `zi`         | zoxide: jump to a frecent dir / pick interactively |
| `v`                       | nvim |
| `c` / `x`                 | clear / exit |
| `la` / `lt`               | long listing / tree (eza) |
| `ttwo`                    | tree, 2 levels deep (incl. hidden) |
| `dot`                     | cd to the dotfiles repo |

Git: `gs` status · `gp` pull · `gd` diff · `gl` graph log · `gb` branch ·
`gco` checkout · `gcobd <name>` new branch · `gc "<msg>"` add-all + commit ·
`gpuo` push -u current branch · `gcmp` checkout main + pull · `grm` delete merged branches.

# GHOSTTY

| -Action-                          | -Keystroke-        |
| --------------------------------- | ----------------- |
| Reload config                     | Cmd + Shift + ,   |
| Toggle quick (drop-down) terminal | Cmd + `           |
| Newline without submitting        | Shift + Enter     |
| Font size up / down / reset       | Cmd + / Cmd - / Cmd 0 |
| New tab / close surface           | Cmd T / Cmd W     |
