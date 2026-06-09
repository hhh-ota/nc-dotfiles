# nc-dotfiles

`nc-dotfiles` is a small dotfiles setup for SSH-based Linux environments where you do not have root privileges.
It was originally made for a NAIST cluster-style environment, but it can also be used on other Linux x86_64 machines.

The setup installs Neovim / LazyVim, tmux, Starship, ble.sh, and several modern Unix command-line tools under your home directory.

## Features

This repository sets up the following tools and configuration files.

- Bash configuration
  - `.bashrc`
  - `.bash_profile`
- Neovim / LazyVim
  - LazyVim starter is cloned during setup
  - Installed to `~/.config/nvim`
- tmux
  - `.tmux.conf`
  - TPM plugin manager
  - Catppuccin status line theme
  - session restore with `tmux-resurrect` and `tmux-continuum`
- Starship prompt
  - `~/.config/starship/starship.toml`
- ble.sh
  - Improves Bash completion and command-line editing
- Modern Unix commands
  - `eza`: modern alternative to `ls`
  - `bat`: modern alternative to `cat`
  - `fd`: modern alternative to `find`
  - `ripgrep`: modern alternative to `grep`
  - `dust`, `gdu`: modern alternatives to `du`
  - `btop`: modern alternative to `top`
  - `hyperfine`: command-line benchmarking tool
  - `procs`: modern alternative to `ps`
  - `delta`: Git diff viewer
  - `lazygit`: Git TUI
  - `zoxide`: smarter alternative to `cd`
  - `xh`: HTTP client
  - `gping`: modern alternative to `ping`
  - `ouch`: archive compression/extraction tool
  - `tldr`: simplified command examples
  - `tokei`: code line counter

## Requirements

This setup assumes the following environment.

- Linux x86_64
- Bash
- tmux
- `curl`
- `git`
- `make`
- `tar`
- `unzip`
- Internet access
- A Nerd Font installed on your local terminal

Root privileges are not required.
Most tools are installed under `$HOME/apps`.

## Nerd Font Requirement

This dotfiles setup assumes that your terminal uses a Nerd Font.
Some tools and themes display icons and special glyphs, especially:

- `eza --icons`
- Starship prompt
- LazyVim icons
- tmux Catppuccin status line

If icons look broken, garbled, or appear as squares, install a Nerd Font on your local machine and set it as your terminal font.
Recommended examples are:

- Hack Nerd Font
- JetBrainsMono Nerd Font
- FiraCode Nerd Font
- CaskaydiaCove Nerd Font

For SSH environments, the font does not need to be installed on the server.
It must be installed and selected in the terminal app on your own computer.

## Directory Structure

The repository itself has the following main files.

```text
nc-dotfiles/
├── .bash_profile
├── .bashrc
├── .config/
│   └── starship/
│       └── starship.toml
├── .tmux.conf
├── setup.sh
├── reset.sh
├── remove.sh
├── LICENSE
└── README.md
```

Some directories are generated during setup and are intentionally not tracked by Git.
For example, LazyVim and tmux plugins are created under `.config/` during setup.

## Installation

Clone this repository into your home directory and run `setup.sh`.

```bash
git clone <this-repository-url> ~/nc-dotfiles
cd ~/nc-dotfiles
bash setup.sh
```

After installation, reload your shell configuration.

```bash
source ~/.bashrc
```

Alternatively, log out and log in again.

## What `setup.sh` Does

`setup.sh` performs the following operations.

1. Creates an `apps` directory under the parent directory of this repository.
2. Installs Neovim into `apps/nvim-linux-x86_64`.
3. Clones the LazyVim starter configuration into `.config/nvim` inside this repository.
4. Installs Starship into `apps/starship/bin`.
5. Installs ble.sh into `apps/blesh`.
6. Installs modern Unix command-line tools under `apps` or `apps/bin`.
7. Installs TPM under `.config/tmux/plugins/tpm`.
8. Backs up existing files and directories in `$HOME` with the `.bak` suffix.
9. Copies the actual files and directories into `$HOME`.

### Important: actual files are copied, not symlinked

Older versions of this setup used symbolic links from `$HOME` to this repository.
However, this caused problems on some cluster environments because compute nodes could not see the symlink target.
For example, if `$HOME` was visible on a login node but the real target directory was not visible on a compute node, commands such as `ls` in `$HOME` could freeze or fail.

To avoid this, the current `setup.sh` copies real files and directories into `$HOME`.
This means the installed environment does not depend on symbolic link targets being visible from every node.

The copied targets are:

```text
.bash_profile -> ~/.bash_profile
.bashrc       -> ~/.bashrc
apps/         -> ~/apps
.config/      -> ~/.config
.tmux.conf    -> ~/.tmux.conf
```

Existing files and directories are renamed with the `.bak` suffix before copying.

```text
~/.bashrc        -> ~/.bashrc.bak
~/.bash_profile -> ~/.bash_profile.bak
~/.config       -> ~/.config.bak
~/.tmux.conf    -> ~/.tmux.conf.bak
~/apps          -> ~/apps.bak
```

## PATH Settings

The `.bashrc` file adds paths such as the following.

```bash
export PATH="$HOME/apps/nvim-linux-x86_64/bin:$PATH"
export PATH="$HOME/apps/starship/bin:$PATH"
export PATH="$HOME/apps/bin:$PATH"
```

It also adds paths for individually installed tools such as `bat`, `fd`, `ripgrep`, `btop`, `delta`, `lazygit`, `zoxide`, `xh`, `gping`, and `ouch`.

## Aliases

The `.bashrc` file defines the following aliases.

```bash
alias ls="eza --icons --group-directories-first"
alias ll="ls -l"
alias lla="ls -la"
alias llt="ls -lT"
alias lta="ls -lTa"
alias ccat="bat"
alias du="dust"
alias rm="rm -i"
alias mv="mv -i"
alias ln="ln -i"
alias cp="cp -i"
alias v="nvim"
```

## tmux

This repository includes a tmux configuration at `.tmux.conf`.
During setup, it is copied to `~/.tmux.conf`.

Main tmux settings:

- Prefix key is changed from `Ctrl-b` to `Ctrl-a`.
- Mouse support is enabled.
- Window and pane indexes start from `1`.
- Vim-like pane movement is available with prefix + `h`, `j`, `k`, `l`.
- Pane splitting uses prefix + `|` and prefix + `-`.
- New panes and windows open in the current directory.
- Copy mode uses vi-style key bindings.
- Catppuccin is used for the status line.
- tmux sessions can be saved and restored using plugins.

### tmux Plugins

TPM is installed into the following directory.

```text
~/.config/tmux/plugins/tpm
```

The plugin path is configured in `.tmux.conf`.

```tmux
set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/.config/tmux/plugins/'
run '~/.config/tmux/plugins/tpm/tpm'
```

Configured plugins:

- `tmux-plugins/tpm`
- `tmux-plugins/tmux-sensible`
- `catppuccin/tmux`
- `tmux-plugins/tmux-resurrect`
- `tmux-plugins/tmux-continuum`
- `tmux-plugins/tmux-open`
- `tmux-plugins/tmux-yank`

After starting tmux, install plugins with:

```text
prefix + I
```

Since the prefix is changed to `Ctrl-a`, press:

```text
Ctrl-a + I
```

To reload tmux config:

```text
Ctrl-a + r
```

## Reset

To disable the environment created by this dotfiles setup and restore the previous backup files, run `reset.sh`.

```bash
cd ~/nc-dotfiles
bash reset.sh
```

`reset.sh` renames the currently installed files and directories with the `.rev` suffix, then restores the original `.bak` backups.

Typical behavior:

```text
~/.bashrc        -> ~/.bashrc.rev
~/.bash_profile -> ~/.bash_profile.rev
~/.config       -> ~/.config.rev
~/.tmux.conf    -> ~/.tmux.conf.rev
~/apps          -> ~/apps.rev

~/.bashrc.bak        -> ~/.bashrc
~/.bash_profile.bak -> ~/.bash_profile
~/.config.bak       -> ~/.config
~/.tmux.conf.bak    -> ~/.tmux.conf
~/apps.bak          -> ~/apps
```

This is mainly useful when you want to roll back the environment after testing.

## Remove

`remove.sh` was added to remove the `.rev` files and directories generated by `reset.sh`.

```bash
cd ~/nc-dotfiles
bash remove.sh
```

It removes the following paths:

```text
~/.bashrc.rev
~/.bash_profile.rev
~/.tmux.conf.rev
~/.config.rev
~/apps.rev
```

Be careful when using `remove.sh`.
It deletes the disabled environment files generated by `reset.sh`, so run it only after confirming that the restored environment works correctly.

## Git Ignore Policy

Generated or heavy configuration directories are ignored by Git.
The current `.gitignore` excludes paths such as:

```text
.config/tmux/plugins/
.config/nvim/
.config/btop/
.config/nvim.bak/
```

This keeps cloned plugin repositories, generated LazyVim files, and local backup files out of this dotfiles repository.

## Important Notes

This setup modifies your existing shell environment.
Before running `setup.sh`, it is recommended to manually back up important configuration files.

Some tool versions and binary architectures are fixed inside `setup.sh`.
If your environment is not Linux x86_64, you need to change the download URLs.

One important point is that the current `lazygit` URL in `setup.sh` uses an ARM64 binary.
For a Linux x86_64 environment, change it to the x86_64 or amd64 release archive before running the setup.

```bash
# Current example in setup.sh
lazygit_0.62.2_linux_arm64.tar.gz

# For Linux x86_64, use an x86_64/amd64 archive instead.
```

`tokei` is installed from a fixed release version, `v12.1.1`, instead of relying on a latest-release URL.
This avoids problems when the latest release does not provide the expected binary archive.

## License

This project is licensed under the terms of the repository license.

