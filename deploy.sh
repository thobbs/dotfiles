#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.vimrc
ln -s "$DIR/.vimrc" ~/.vimrc

rm -f ~/.bashrc
ln -s "$DIR/.bashrc" ~/.bashrc

rm -f ~/.bash_aliases
ln -s "$DIR/.bash_aliases" ~/.bash_aliases

rm -f ~/.gitconfig
ln -s "$DIR/.gitconfig" ~/.gitconfig
