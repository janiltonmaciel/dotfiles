# EDITOR DEFAULT
export EDITOR="code"

# HOME PROJETOS
export PROJETOS="$HOME/projetos"

# GOLANG
export GOPATH="$PROJETOS/go"
export GOBIN="$GOPATH/bin"

export PIP_DOWNLOAD_CACHE="$HOME/Library/Caches/pip-downloads"
export PYTHONUNBUFFERED=1
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUALENVWRAPPER_SCRIPT="/usr/local/bin/virtualenvwrapper.sh"
export WORKON_HOME="$HOME/.virtualenvs"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export COPYFILE_DISABLE=true
export GPG_TTY=$(tty)
export PATH="$PATH:./node_modules/.bin:$GOPATH/bin"


export NVM_DIR="$HOME/.nvm"
# export CFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
