# EDITOR DEFAULT
export EDITOR="code -w"

# HOME PROJETOS
export PROJETOS="$HOME/Projetos"

# GOLANG
export GOPATH="$PROJETOS/go"
export GOBIN="$GOPATH/bin"

# PYTHON
export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE="$HOME/Library/Caches/pip-downloads"
export PYTHONUNBUFFERED=1
export WORKON_HOME="$HOME/.virtualenvs"

# NODE
export NVM_DIR="$HOME/.nvm"

# GPG
export GPG_TTY=$(tty)

# ZSH
export ZSH="$HOME/.oh-my-zsh"

# OTHERS
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# HISTORY
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE="100000"
export SAVEHIST="$HISTSIZE"
export ERL_AFLAGS="-kernel shell_history enabled"

# PATHS
export PATH="/Applications/PyCharm.app/Contents/MacOS:$PATH"
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
# export PATH="$HOME/.yarn/bin:$PATH"

# BREW ENVIRONMENT
eval "$(/opt/homebrew/bin/brew shellenv)"

# ZSH OPTIONS ---------------------------------------------------------
setopt hist_ignore_all_dups inc_append_history

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# append new history entries to the history file
setopt APPEND_HISTORY

# save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE
