#! /usr/bin/env bash

## SETUP PLUGINS
pushd ~/.oh-my-zsh/custom/plugins

# Syntax Highlight
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
popd

# Replace zsh rc file
rm -f ~/.zshrc
ln -s "$HOME/dotfiles/zshrc" ~/.zshrc
