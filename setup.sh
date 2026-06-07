#!/bin/bash
#           _                    _
#          | |                  | |
#  ___  ___| |_ _   _ _ __   ___| |__
# / __|/ _ \ __| | | | '_ \ / __| '_ \
# \__ \  __/ |_| |_| | |_) |\__ \ | | |
# |___/\___|\__|\__,_| .__(_)___/_| |_|
#                    | |
#                    |_|

# For ssh environment without root authority.
# I made this setup.sh and dotfiles for NAIST cluster system!

# utils
info() {
  echo -e "\033[32m[Info]\033[0m $*"
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR=$(dirname $SCRIPT_DIR)

# NeoVim
# ------
# Install Vim
info "Install Neovim"
mv $HOME_DIR/apps{,.bak}
mkdir -p $HOME_DIR/apps
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 $HOME_DIR/apps
rm nvim-linux-x86_64.tar.gz

# Setup LazyVim
info "Setup LazyVim"
mv $HOME/.config/nvim{,.bak}
mv $SCRIPT_DIR/.config/nvim{,.bak}
mv $HOME/.local/share/nvim{,.bak}
mv $HOME/.local/state/nvim{,.bak}
mv $HOME/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter $SCRIPT_DIR/.config/nvim
rm -rf $SCRIPT_DIR/.config/nvim/.git

# Starship
# --------
# Install Starship
info "Install Starship"
mkdir -p $HOME_DIR/apps/starship/bin
curl -LO https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar xzf starship-x86_64-unknown-linux-musl.tar.gz
mv starship $HOME_DIR/apps/starship/bin
rm starship-x86_64-unknown-linux-musl.tar.gz

# ble.sh
# ------
# Install ble.sh
info "Install ble.sh"
mkdir -p $HOME_DIR/apps/blesh
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX="$HOME_DIR/apps/blesh"
rm -r $HOME_DIR/ble.sh

# Install Alternative Modern Unix Commands
# ----------------------------------------
mkdir -p $HOME_DIR/apps/bin
BIN_DIR="$HOME_DIR/apps/bin"
# --- file display and search ---
# ls: eza
info "Install eza"
curl -L -o eza.tar.gz "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz"
tar -xzf eza.tar.gz -C $BIN_DIR
rm eza.tar.gz
# cat: bat
info "Install bat"
curl -L -o bat.tar.gz "https://github.com/sharkdp/bat/releases/latest/download/bat-v0.26.1-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf bat.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/bat-v0.26.1-x86_64-unknown-linux-gnu" $HOME_DIR/apps/bat
rm bat.tar.gz
# find: fd
info "Install fd"
curl -L -o fd.tar.gz "https://github.com/sharkdp/fd/releases/latest/download/fd-v10.4.2-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf fd.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/fd-v10.4.2-x86_64-unknown-linux-gnu" $HOME_DIR/apps/fd
rm fd.tar.gz
# grep: ripgrep
info "Install ripgrep"
curl -L -o ripgrep.tar.gz "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz"
tar -xzf ripgrep.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/ripgrep-15.1.0-x86_64-unknown-linux-musl" $HOME_DIR/apps/ripgrep
rm ripgrep.tar.gz
# --- observing disk system ---
# du: dust
info "Install dust"
curl -L -o dust.tar.gz "https://github.com/bootandy/dust/releases/latest/download/dust-v1.2.4-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf dust.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/dust-v1.2.4-x86_64-unknown-linux-gnu" $HOME_DIR/apps/dust
rm dust.tar.gz
# du: gdu
info "install gdu"
curl -L -o gdu.tgz "https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz"
tar -zxf gdu.tgz -C $BIN_DIR ; mv $BIN_DIR/gdu_linux_amd64 $BIN_DIR/gdu
rm gdu.tgz
# top: btop
info "Install btop"
curl -L -o btop.tar.gz "https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-unknown-linux-musl.tar.gz"
tar -xzf btop.tar.gz -C $HOME_DIR/apps
rm btop.tar.gz
# time: hyperfine
info "Install hyperfine"
curl -L -o hyperfine.tar.gz "https://github.com/sharkdp/hyperfine/releases/latest/download/hyperfine-v1.20.0-x86_64-unknown-linux-musl.tar.gz"
tar -xzf hyperfine.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/hyperfine-v1.20.0-x86_64-unknown-linux-musl" $HOME_DIR/apps/hyperfine
rm hyperfine.tar.gz
# ps: procs
info "Install procs"
curl -L -o procs.zip "https://github.com/dalance/procs/releases/latest/download/procs-v0.14.11-x86_64-linux.zip"
unzip procs.zip -d $BIN_DIR
rm procs.zip
# --- git ---
# diff: delta
info "Install delta"
curl -L -o delta.tar.gz "https://github.com/dandavison/delta/releases/latest/download/delta-0.19.2-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf delta.tar.gz -C $HOME_DIR/apps
rm delta.tar.gz
# git: lazygit
info "Install lazygit"
curl -L -o lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_0.62.2_linux_arm64.tar.gz"
mkdir -p "$HOME_DIR/apps/lazygit" ; tar -xzf lazygit.tar.gz -C $HOME_DIR/apps/lazygit
rm lazygit.tar.gz
# --- moving ---
# cd: zoxide
info "Install zoxide"
curl -L -o zoxide.tar.gz "https://github.com/ajeetdsouza/zoxide/releases/latest/download/zoxide-0.9.9-x86_64-unknown-linux-musl.tar.gz"
mkdir -p "$HOME_DIR/apps/zoxide" ; tar -xzf zoxide.tar.gz -C $HOME_DIR/apps/zoxide
rm zoxide.tar.gz
# --- network ---
# curl: xh
info "Install xh"
curl -L -o xh.tar.gz "https://github.com/ducaale/xh/releases/latest/download/xh-v0.25.3-x86_64-unknown-linux-musl.tar.gz"
tar -xzf xh.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/xh-v0.25.3-x86_64-unknown-linux-musl" $HOME_DIR/apps/xh
rm xh.tar.gz
# ping: gping
info "Install gping"
curl -L -o gping.tar.gz "https://github.com/orf/gping/releases/latest/download/gping-Linux-gnu-x86_64.tar.gz"
mkdir -p $HOME_DIR/apps/gping ; tar -xzf gping.tar.gz -C $HOME_DIR/apps/gping
rm gping.tar.gz
# --- compress, extract and others ---
# tar,unzip: ouch
info "Install ouch"
curl -L -o ouch.tar.gz "https://github.com/ouch-org/ouch/releases/latest/download/ouch-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf ouch.tar.gz -C $HOME_DIR/apps ; mv "$HOME_DIR/apps/ouch-x86_64-unknown-linux-gnu" $HOME_DIR/apps/ouch
rm ouch.tar.gz
# man: tldr
info "Install tldr"
curl -L -o tldr "https://github.com/tealdeer-us/tealdeer/releases/latest/download/tealdeer-linux-x86_64-musl"
mv tldr $BIN_DIR
# wc: tokei
info "Install tokei"
curl -L -o tokei.tar.gz "https://github.com/XAMPPRocky/tokei/releases/download/tokei-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf tokei.tar.gz -C $BIN_DIR
rm tokei.tar.gz

# Create symbolic link
# --------------------
info "Create Symbolic Link"
info "Link to .bash_profile"
mv $HOME/.bash_profile{,.bak}
ln -sfn "$SCRIPT_DIR/.bash_profile" "$HOME/.bash_profile"
info "Link to .bashrc"
mv $HOME/.bashrc{,.bak}
ln -sfn "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
info "Link to Apps Directory"
mv $HOME/apps{,.bak}
ln -sfn "$HOME_DIR/apps" "$HOME/apps"
info "Link to .config Directory"
mv $HOME/.config{,.bak}
ln -sfn "$SCRIPT_DIR/.config" "$HOME/.config"
