#!/bin/zsh

# my deploy script
# _very_ unportable, will fix later

# backup_and_deploy <local_dir> <repo_dir> <file_name>
function backup_and_deploy {
    mkdir -p $1
    mv $1/$3 $1/$3.old
    cp $2/$3 $1
}

# alacritty
backup_and_deploy $HOME/.config/alacritty/ alacritty alacritty.yml

# nvim
backup_and_deploy $HOME/.config/nvim/ nvim init.lua
rm -r $HOME/.config/nvim/scripts
cp -r nvim/scripts $HOME/.config/nvim/scripts
rm -r $HOME/.config/nvim/lua
cp -r nvim/lua $HOME/.config/nvim/lua

nvim +'PackerInstall' +qall

# tmux
backup_and_deploy $HOME/ tmux .tmux.conf
tmux source $HOME/.tmux.conf

# zsh
backup_and_deploy $HOME/ zsh .zshrc
source $HOME/.zshrc
