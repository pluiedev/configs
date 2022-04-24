#!/bin/bash

# my deploy script
# _very_ unportable, will fix later

# alacritty
cp ./alacritty/alacritty.yml $HOME/.config/alacritty/

# nvim
cp ./nvim/init.vim $HOME/.config/nvim/

# tmux
cp ./tmux/.tmux.conf $HOME/
tmux source $HOME/.tmux.conf

