# nc-dotfiles

`nc-dotfiles` is a small dotfiles setup for SSH-based Linux environments where you do not have root privileges.
It was originally made for a NAIST cluster-style environment, but it can also be used on other Linux x86_64 machines.

The setup installs Neovim, LazyVim, Starship, ble.sh, and several modern Unix command-line tools under your home directory.

## Features

This repository sets up the following tools and configuration files.

- Bash configuration
  - `.bashrc`
  - `.bash_profile`
- Neovim / LazyVim
  - `~/.config/nvim`
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
- `curl`
- `git`
- `make`
- `tar`
- `unzip`
- Internet access

Root privileges are not required.
Most tools are installed under `$HOME/apps`.

## Directory Structure

```text
nc-dotfiles/
├── .bash_profile
├── .bashrc
├── .config/
│   ├── nvim/
│   └── starship/
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
7. Backs up existing configuration files and directories.
8. Creates symbolic links from your home directory to this repository.

Existing files and directories are renamed with the `.bak` suffix.

```text
~/.bashrc        -> ~/.bashrc.bak
~/.bash_profile -> ~/.bash_profile.bak
~/.config       -> ~/.config.bak
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
alias grep="ripgrep"
alias du="dust"
alias rm="rm -i"
alias mv="mv -i"
alias ln="ln -i"
alias cp="cp -i"
alias v="nvim"
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

