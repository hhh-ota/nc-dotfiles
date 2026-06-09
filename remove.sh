#                                          _     
#                                         | |    
#  _ __ ___ _ __ ___   _____   _____   ___| |__  
# | '__/ _ \ '_ ` _ \ / _ \ \ / / _ \ / __| '_ \ 
# | | |  __/ | | | | | (_) \ V /  __/_\__ \ | | |
# |_|  \___|_| |_| |_|\___/ \_/ \___(_)___/_| |_|

# To remove .rev files generated after conducting reset.sh.
# This script can break your environment. So I strongly suggest confirming to you.

# Remove .rev files
rm $HOME/.bashrc.rev
rm $HOME/.bash_profile.rev
rm $HOME/.tmux.conf.rev
rm -r $HOME/.config.rev
rm -r $HOME/apps.rev
