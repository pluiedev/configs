#!/bin/zsh

# synchronizing configs from local directories

# alacritty
mkdir alacritty
cp $HOME/.config/alacritty/alacritty.yml ./alacritty/

# nvim
mkdir nvim
cp $HOME/.config/nvim/init.vim ./nvim/

# tmux
mkdir tmux
cp $HOME/.tmux.conf ./tmux/

# zsh
mkdir zsh
cp $HOME/.zshrc ./zsh/
