# EDITOR DEFAULT
export EDITOR="code"

# HOME PROJETOS
export PROJETOS="$HOME/projetos"

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


# PATHS
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
# export PATH="$HOME/.yarn/bin:$PATH"

# BREW ENVIRONMENT
eval "$(/opt/homebrew/bin/brew shellenv)"
