# http://fishshell.com/docs/current/tutorial.html#tut_universal

# EDITOR DEFAULT
set -Ux EDITOR "code"

# HOME PROJETOS
set -Ux PROJETOS "$HOME/projetos"

# GOLANG
set -Ux GOPATH "$PROJETOS/go"
set -Ux GOBIN "$GOPATH/bin"

# PYTHON
set -Ux PIP_DOWNLOAD_CACHE "$HOME/Library/Caches/pip-downloads"
set -Ux PYTHONUNBUFFERED 1
set -Ux PIP_REQUIRE_VIRTUALENV true
# set -U VIRTUALFISH_PLUGINS "compat_aliases"
# set -U VIRTUALFISH_COMPAT_ALIASES "True"
# set -Ux VIRTUALENVWRAPPER_SCRIPT /usr/local/bin/virtualenvwrapper.sh
# set -Ux VIRTUALENVWRAPPER_HOOK_DIR "$HOME/.virtualenvs"
# set -Ux WORKON_HOME $VIRTUALENVWRAPPER_HOOK_DIR

# BREW
set -Ux BREW_PREFIX (brew --prefix)

# CURL
set -Ux CURL_CA_BUNDLE "$HOME/.curl/curl-ca-bundle.crt"

# Locale
# set -Ux LC_ALL en_US.UTF-8
# set -Ux LANG en_US.UTF-8

# NODE
# set -U NVM_DIR "$HOME/.nvm"

# RVM
# set -Ux rvm_project_rvmrc 0

# FISH USER PATH

# SQL LITE
set -U fish_user_paths /usr/local/opt/sqlite/bin $fish_user_paths

# Python (poetry)
# set -U fish_user_paths $HOME/.poetry/bin $fish_user_paths

# JAVA
set -U fish_user_paths /usr/local/opt/openjdk/bin $fish_user_paths

# Ruby (rvm)
# set -U fish_user_paths $HOME/.rvm/bin $fish_user_paths

# GOLANG
set -U fish_user_paths $GOPATH/bin $fish_user_paths

# OPEN SSL
set -U fish_user_paths /usr/local/opt/openssl/bin $fish_user_paths

# LOCAL SBIN
set -U fish_user_paths /usr/local/sbin $fish_user_paths

# CURL SSL
# set -U fish_user_paths /usr/local/opt/curl-openssl/bin $fish_user_paths

# NODE
set -U fish_user_paths ./node_modules/.bin $fish_user_paths

# LOCAL BIN
set -U fish_user_paths /usr/local/bin $fish_user_paths
