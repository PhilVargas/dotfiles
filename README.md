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
| `iterm2/`   | iTerm2 profile + base16 color schemes (imported manually).     |
| `linters/`  | Project-level linter configs (not symlinked).                  |

## Notes

- **Runtimes:** Ruby and Node are managed by `mise`; `yarn`/`pnpm` come from
  `corepack`. The setup pins `ruby@latest` and `node@lts` globally.
- **Vim:** plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug).
  Edit the list in [`home/vimrc.bundles`](home/vimrc.bundles), then run
  `:PlugInstall` (or the `pluginstall` shell alias).
- **Secrets:** machine-specific values go in `home/zshrc.secret` (gitignored,
  created automatically on first run).

Inspired by [jkrmr/dotfiles](https://github.com/jkrmr/dotfiles).
