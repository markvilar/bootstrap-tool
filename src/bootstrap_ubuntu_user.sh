#!/usr/bin/bash

# Set up dotfiles
curl https://raw.githubusercontent.com/markvilar/dotfiles/master/vim/.vimrc \
    > ~/.vimrc

curl https://raw.githubusercontent.com/markvilar/dotfiles/master/bash/bashrc \
    > ~/.bashrc

curl https://raw.githubusercontent.com/markvilar/dotfiles/master/bash/profile \
    > ~/.profile

# Set up Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
