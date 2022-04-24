#!/bin/zsh

# synchronizing configs from local directories

# alacritty
mkdir -p alacritty
cp $HOME/.config/alacritty/alacritty.yml ./alacritty/

# nvim
mkdir -p nvim
cp $HOME/.config/nvim/init.vim ./nvim/

# tmux
mkdir -p tmux
cp $HOME/.tmux.conf ./tmux/

# zsh
mkdir -p zsh
cp $HOME/.zshrc ./zsh/
