#                     _         _
#                    | |       | |
#  _ __ ___  ___  ___| |_   ___| |__
# | '__/ _ \/ __|/ _ \ __| / __| '_ \
# | | |  __/\__ \  __/ |_ _\__ \ | | |
# |_|  \___||___/\___|\__(_)___/_| |_|

# This script is for development of dotfiles.
# If you want to reset environment that made by this dotfiles, conduct this.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

warning() {
  printf '\033[33m[Warning]\033[0m %s\n' "$*"
}

# Disable files
warning "Disable .bashrc."
mv $HOME/.bashrc{,.rev}
warning "Disable .bash_profile"
mv $HOME/.bash_profile{,.rev}
warning "Disable apps directory."
mv $HOME/apps{,.rev}
warning "Disable .config directory"
mv $HOME/.config{,.rev}
warning "Disable .tmux.conf"
mv $HOME/.tmux.conf{,.rev}

# restore the dotfiles to their original state
warning "Restore .bashrc from backup."
mv $HOME/.bashrc.bak $HOME/.bashrc
mv $HOME/.bash_profile.bak $HOME/.bash_profile
mv $HOME/apps.bak $HOME/apps

# Delete apps diretory
rm -r $SCRIPT_DIR/../apps
