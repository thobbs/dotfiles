#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.vimrc
ln -s "$DIR/.vimrc" ~/.vimrc

rm -f ~/.bashrc
ln -s "$DIR/.bashrc" ~/.bashrc

rm -f ~/.gitconfig
ln -s "$DIR/.gitconfig" ~/.gitconfig

rm -rf ~/.ipython
ln -s "$DIR/.ipython" ~/.ipython

git submodule init
git submodule update
rm -rf ~/.vim
ln -s "$DIR/.vim" ~/.vim

cp fonts/* ~/.fonts
sudo fc-cache -vf
rm -f /tmp/Powerline.cache
