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
  - `~/.config/nvim`
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

### Nerd Font Requirement

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

```text
nc-dotfiles/
├── .bash_profile
├── .bashrc
├── .config/
│   ├── nvim/
│   ├── starship/
│   └── tmux/
│       └── plugins/
│           └── tpm/
├── .tmux.conf
├── setup.sh
├── reset.sh
├── LICENSE
└── README.md
```

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

1. Creates an `apps` directory under your home directory.
2. Installs Neovim into `$HOME/apps/nvim-linux-x86_64`.
3. Sets up LazyVim starter configuration under `.config/nvim`.
4. Installs Starship into `$HOME/apps/starship/bin`.
5. Installs ble.sh into `$HOME/apps/blesh`.
6. Installs modern Unix command-line tools under `$HOME/apps` or `$HOME/apps/bin`.
7. Installs TPM under `.config/tmux/plugins/tpm`.
8. Backs up existing configuration files and directories.
9. Creates symbolic links from your home directory to this repository.

Existing files and directories are renamed with the `.bak` suffix.

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
During setup, it is linked to `~/.tmux.conf`.

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

To undo the environment created by this dotfiles setup, run `reset.sh`.

```bash
cd ~/nc-dotfiles
bash reset.sh
```

`reset.sh` removes the symbolic links and restores the original files from `.bak` backups.

## Important Notes

This setup modifies your existing shell environment.
Before running `setup.sh`, it is recommended to manually back up important configuration files.

Also, some tool versions and binary architectures are fixed inside `setup.sh`.
If your environment is not Linux x86_64, you need to change the download URLs.

One important point is that the current `lazygit` URL in `setup.sh` uses an ARM64 binary.
For a Linux x86_64 environment, change it to the x86_64 or amd64 release archive before running the setup.

```bash
# Current example in setup.sh
lazygit_0.62.2_linux_arm64.tar.gz

# For Linux x86_64, use an x86_64/amd64 archive instead.
```

## License

This project is licensed under the terms of the repository license.

