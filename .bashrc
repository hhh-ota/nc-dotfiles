#    _               _
#   | |             | |
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# PATH of Apps
# ----
# Apps
export PATH="$HOME/apps/nvim-linux-x86_64/bin:$PATH"
export PATH="$HOME/apps/starship/bin:$PATH"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
# Alternative Modern Unix Commands
export PATH="$HOME/apps/bin:$PATH"
export PATH="$HOME/apps/bat:$PATH"
export PATH="$HOME/apps/fd:$PATH"
export PATH="$HOME/apps/ripgrep:$PATH"
export PATH="$HOME/apps/dust:$PATH"
export PATH="$HOME/apps/btop/bin:$PATH"
export PATH="$HOME/apps/hyperfine:$PATH"
export PATH="$HOME/apps/delta:$PATH"
export PATH="$HOME/apps/lazygit:$PATH"
export PATH="$HOME/apps/zoxide:$PATH"
export PATH="$HOME/apps/xh:$PATH"
export PATH="$HOME/apps/gping:$PATH"
export PATH="$HOME/apps/ouch:$PATH"

# App Settings
# ------------
# starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
else
  PS1='\u@\h:\w\$ '
fi
# ble.sh
source $HOME/apps/blesh/share/blesh/ble.sh
# zoxide
eval "$(zoxide init bash)"

# Alias
# -----
# ls
alias ls="eza --icons --group-directories-first"
alias ll="ls -l"
alias lla="ls -la"
alias llt="ls -lT"
alias lta="ls -lTa"
alias ccat="bat"
# du
alias du="dust"
# confirm whether do you really wan to do it before operating for file or directory
alias rm="rm -i"
alias mv="mv -i"
alias ln="ln -i"
alias cp="cp -i"
# NeoVim
alias v="nvim"
