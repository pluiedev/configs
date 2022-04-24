#!/bin/zsh

# my deploy script
# _very_ unportable, will fix later

# backup_and_deploy <local_dir> <repo_dir> <file_name>
function backup_and_deploy {
    mv $1/$3 $1/$3.old
    cp $2/$3 $1
}

# alacritty
backup_and_deploy $HOME/.config/alacritty alacritty alacritty.yml

# nvim
backup_and_deploy $HOME/.config/nvim/ nvim init.vim

# tmux
backup_and_deploy $HOME/ tmux .tmux.conf
tmux source $HOME/.tmux.conf

# zsh
backup_and_deploy $HOME/ zsh .zshrc
source $HOME/.zshrc
