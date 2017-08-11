#!/bin/bash

DOTFILES=(.vimrc .zshrc)

for file in ${DOTFILES[@]}
do
  ln -fnsv $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d ~/.zplug ]; then
  curl -sL zplug.sh/installer | zsh
fi
