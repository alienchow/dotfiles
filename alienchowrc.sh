#!/usr/bin/env bash

# ======= #
# Hotkeys #
# ======= #
alias ll='ls -al'

# ============ #
# PROMPT TWEAK #
# ============ #
get_git_branch() {
	BRANCH=$(git branch 2> /dev/null | grep "^* .\+$" | sed "s/^* //")
	OUTPUT=
	if [[ -n "$BRANCH" ]]; then OUTPUT="$BRANCH"; fi
	if [[ -n "$OUTPUT" ]]; then echo "($OUTPUT)"; fi
}

get_git_changes() {
	CHANGES=$(git status 2> /dev/null | grep -e "^Changes not staged for commit:\|^Untracked files")
	if [[ -n "$CHANGES" ]]; then echo "*"; fi
}

export PS1="[\[\e[31m\]\u\[\e[m\]@\[\e[1;31m\]\h\[\e[m\]:\W]\[\e[1;32m\]\$(get_git_branch)\[\e[1;37m\]\$(get_git_changes)\[\e[1;32m\]\[\e[m\]$ "

# ========== #
# GIT TWEAKS #
# ========== #
git config --global core.excludesfile '~/.gitignore'

# ===================== #
# ENVIRONMENT VARIABLES #
# ===================== #
export GOPATH="~/go"
export GOROOT="/usr/local/go"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
