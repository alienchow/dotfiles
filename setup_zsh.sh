#! /usr/bin/env bash

## SETUP PLUGINS
cd ~/.oh-my-zsh/custom/plugins

# Syntax Highlight
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

# Replace zsh rc file
rm -f ~/.zshrc
ln -s "$HOME/dotfiles/zshrc" ~/.zshrc
