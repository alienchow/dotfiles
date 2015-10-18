#! /usr/bin/env/bash

## SETUP ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## INIT GLOBAL ENVIRONMENT VARIABLES
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export VIMHOME=~/.vim
if [[ "$(uname)" == "Darwin" ]]; then
  export BASHRC=~/.bash_profile
else
  export BASHRC=~/.bashrc
fi

## INIT DIRECTORIES
# Vim
mkdir -p $VIMHOME/backup
mkdir -p $VIMHOME/bundle
rm -rf $VIMHOME/colors

## SETUP RC FILES
# Bash
if [[ -z "$(cat $BASHRC | grep alienchowrc)" ]]; then
  echo -e "\n# MY RC FILE\n. $DOTFILES/alienchowrc.sh" >> $BASHRC
fi

# Zsh
export ZSHRC=~/.zshrc
if [[ -z "$(cat "$ZSHRC" | grep alienchowrc)" ]]; then
  echo -e "\n# MY RC FILE\n. $DOTFILES/alienchowrc.sh" >> ~/.zshrc
fi

# Vim
ln -s "$DOTFILES/vimrc" ~/.vimrc

## SETUP CONFIG FILES
# Vim
ln -s "$DOTFILES/vim/colors" "$VIMHOME/colors"
VUNDLE_LOC="$VIMHOME/bundle/Vundle.vim"
if [[ ! -d "$VUNDLE_LOC" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_LOC"
fi
vim -S "$DOTFILES/vim_setup.vim"

# Git
ln -s "$DOTFILES/gitignore" ~/.gitignore

# Ctags
ln -s "$DOTFILES/ctags" ~/.ctags
