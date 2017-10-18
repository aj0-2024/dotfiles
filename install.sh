#!/bin/sh

# VIM Plugins
# install the vim-plug manager
 ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TODO:  install fish

# install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# install fisher plugins
fisher fnm
fisher paths
fisher z

