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

# unlink
warning "Unlink .bashrc."
unlink $HOME/.bashrc
warning "Unlink .bash_profile"
unlink $HOME/.bash_profile
warning "Unlink apps directory."
unlink $HOME/apps
warning "Unlink .config directory"
unlink $HOME/.config
warning "Unlink .tmux.conf"
unlink $HOME/.tmux.conf

# restore the dotfiles to their original state
warning "Restore .bashrc from backup."
mv $HOME/.bashrc.bak $HOME/.bashrc
mv $HOME/.bash_profile.bak $HOME/.bash_profile
mv $HOME/apps.bak $HOME/apps

# Delete apps diretory
rm -r $SCRIPT_DIR/../apps
