#!/bin/bash

DOTFILES=(.vimrc)

for file in ${DOTFILES[@]}
do
  ln -fnsv $HOME/dotfiles/$file $HOME/$file
done
