#!/bin/bash

DOTFILES=(.tmux.conf .vimrc .zshrc vscode nvim .editorconfig)

for file in ${DOTFILES[@]}
do
  if [ $file == 'vscode' ]; then
    ln -fnsv $HOME/dotfiles/vscode/setting.json $HOME/Library/Application\ Support/Code/User
  elif [ $file == 'nvim' ]; then
    ln -fnsv $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
  else
    ln -fnsv $HOME/dotfiles/$file $HOME/$file
  fi
done

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi

if [ ! -d ~/.zplug ]; then
  curl -sL zplug.sh/installer | zsh
fi
