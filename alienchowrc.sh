#!/usr/bin/env bash

# ===================== #
# ENVIRONMENT VARIABLES #
# ===================== #
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GOTOOLDIR="/usr/local/go/pkg/tool/darwin_amd64"
export GOROOT_BOOTSTRAP="/usr/local/go1.4.2"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export DOTFILE_PATH="/usr/local/dotfiles"

# =============== #
# Update dotfiles #
# =============== #
updot_func() {
  if [[ -z "$DOTFILE_PATH" ]]; then
    echo "DOTFILE_PATH environment variable not set!"
    return
  fi

  if [[ ! -d "$DOTFILE_PATH" ]]; then
    echo "$DOTFILE_PATH does not exist!"
    return
  fi

  pushd $DOTFILE_PATH
  git pull origin master
  popd
}
alias updot="updot_func > /dev/null 2>&1 && echo 'Updated to latest dotfiles.'"

# ======= #
# Hotkeys #
# ======= #
alias ll='ls -al'

# ============ #
# PROMPT TWEAK #
# ============ #
get_git_branch() {
	BRANCH=$(git branch 2> /dev/null | grep "^* .\+$" | sed "s/^* //")
	if [[ -n "$BRANCH" ]]; then OUTPUT="$BRANCH"; fi
	if [[ -n "$OUTPUT" ]]; then echo "($OUTPUT)"; fi
}

get_git_changes() {
	CHANGES=$(git status 2> /dev/null | grep -e "^Changes not staged for commit:\|^Untracked files:\|Changes to be committed:")
	if [[ -n "$CHANGES" ]]; then echo "*"; fi
}

export PS1="[\[\e[36m\]\u\[\e[0m\]@\[\e[31m\]\h\[\e[0m\] \W\[\e[1;32m\] $(get_git_branch)\[\e[1;37m\]\$(get_git_changes)\[\e[0m\]]\$ "

# ========== #
# GIT TWEAKS #
# ========== #
git config --global core.excludesfile '~/.gitignore'
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
