#!/bin/bash
# run in top level repo directory
# assumes ubuntu

# copy configs abd scripts
cp src/*  ~
cp -R scripts ~
cp -R xmonad ~

# set up vim folders
sudo apt-get -y install gnome-vim
mkdir ~/.vim
mkdir ~/.vim/swps
mkdir ~/.vim/plugins
cp vim_plugins/* ~/.vim/plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git

# set up other utilities
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install xmonad
