# dotfiles

Personal macOS dotfiles. One script bootstraps a fresh laptop: installs
Homebrew packages, Ruby/Node via [mise](https://mise.jdx.dev), and symlinks
the configs in [`home/`](home/) into `$HOME`.

## Installation

On a fresh machine, run:

```sh
curl -fsSL https://raw.githubusercontent.com/PhilVargas/dotfiles/main/laptop/setup | bash
```

The script is idempotent — safe to re-run any time to pick up new packages or
re-link files.

## Layout

| Path        | Purpose                                                        |
| ----------- | -------------------------------------------------------------- |
| `laptop/setup` | Bootstrap script (Xcode CLT, Homebrew, mise, symlinks, vim-plug). |
| `Brewfile`  | Declarative Homebrew packages (`brew bundle`).                 |
| `home/`     | Config files symlinked into `$HOME` (`home/zshrc` → `~/.zshrc`). |
| `shell/`    | Zsh config sourced by `home/zshrc` (env, aliases, prompt).     |
| `vscode/`   | `settings.json`, symlinked into VSCode's user settings.        |
| `iterm2/`   | iTerm2 profile + base16-harmonic16 color scheme (imported manually). |

## Notes

- **Runtimes:** Ruby and Node are managed by `mise`, with versions declared in
  [`home/config/mise/config.toml`](home/config/mise/config.toml); `yarn`/`pnpm`
  come from `corepack`. Bump versions there and re-run `mise install`.
- **Shell:** zsh with `fzf` (Ctrl-R/Ctrl-T), `zsh-autosuggestions`, and
  `zsh-syntax-highlighting` wired up in [`shell/plugins.sh`](shell/plugins.sh).
- **Git:** uses `git-delta` as the pager; `push.autoSetupRemote` is on, so new
  branches push without `--set-upstream`.
- **Vim:** plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug)
  (`fzf.vim` for finding, `ALE` for linting). Edit the list in
  [`home/vimrc.bundles`](home/vimrc.bundles), then run `:PlugInstall` (or the
  `pluginstall` shell alias).
- **Secrets:** machine-specific values go in `home/zshrc.secret` (gitignored,
  created automatically on first run).

## Themes

Native ports of **Catppuccin** (Mocha, Macchiato) and **Tokyo Night** (Night,
Storm) are wired across vim, tmux, iTerm2, and VSCode. Theme names:
`catppuccin-mocha`, `catppuccin-macchiato`, `tokyonight-night`, `tokyonight-storm`.

vim + tmux share one source of truth — `~/.config/theme` (default
`catppuccin-mocha`), exported as `$THEME`:

```sh
theme                      # show current + options
theme tokyonight-storm     # persist; restyles tmux live, vim/new shells on next launch
```

iTerm2 and VSCode use their own pickers (they can't read `$THEME` at theme-time):

- **iTerm2:** Settings → Profiles → Colors → *Color Presets* → Import each file in
  [`iterm2/themes/`](iterm2/themes/), then pick one. (Live, instant.)
- **VSCode:** `Cmd-K Cmd-T`. The Catppuccin and Tokyo Night extensions are
  installed by `laptop/setup`; default is set to Catppuccin Mocha.

Inspired by [jkrmr/dotfiles](https://github.com/jkrmr/dotfiles).
