#! /usr/bin/env/bash

## INIT GLOBAL ENVIRONMENT VARIABLES
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export VIMHOME="$HOME/.vim"
if [[ "$(uname)" == "Darwin" ]]; then
  export BASHRC="$HOME/.bash_profile"
else
  export BASHRC="$HOME/.bashrc"
fi

## INIT DIRECTORIES
# Vim
mkdir -p $VIMHOME/backup
mkdir -p $VIMHOME/bundle
rm -rf $VIMHOME/colors

## SETUP RC FILES
# Bash
if [[ -z "$(echo $BASHRC | grep alienchowrc)" ]]; then
  echo -e "\n# MY RC FILE\n. $DOTFILES/alienchowrc.sh" >> $BASHRC
fi

# Vim
ln -s "$DOTFILES/vimrc" "$HOME/.vimrc"

## SETUP CONFIG FILES
# Vim
ln -s "$DOTFILES/vim/colors" "$VIMHOME/colors"
VUNDLE_LOC="$VIMHOME/bundle/Vundle.vim"
if [[ ! -d "$VUNDLE_LOC" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_LOC"
fi
vim -S "$DOTFILES/vim_setup.vim"

# Git
ln -s "$DOTFILES/gitignore" "$HOME/.gitignore"
