#!/bin/bash
# run in /dotfiles

# copy configs and scripts
cp -r src/.  ~
cp -R scripts ~
cp -R xmonad ~

# set up vim folders
sudo apt-get -y install gnome-vim
mkdir ~/.vim
mkdir ~/.vim/swps
mkdir ~/.vim/plugins
cp vim_plugins/* ~/.vim/plugin
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/.vim/
cd ~/ ; ln -sf 'dotfiles/vimwiki' .
cd dotfiles

# set up emacs el
cd ~/ ; ln -sf 'dotfiles/src/.emacs.d' .
cd dotfiles

# set up other utilities
sudo apt-get -y install silversearcher-ag
sudo apt-get -y install postgresql
sudo apt-get -y install xmonad

### languages and environments ###

# ruby / rbenv setup
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
cd ~/dotfiles
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# haskell / stack setup
sudo apt-get -y install ghc
wget -qO- https://get.haskellstack.org/ | sh

# node / npm setup
sudo apt-get -y install nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get -y install npm


### qol application setup ###

# chrome repo
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# spotify repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# update, install
sudo apt-get update
sudo apt-get install spotify-client
sudo apt-get install google-chrome-stable
