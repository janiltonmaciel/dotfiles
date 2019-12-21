# http://fishshell.com/docs/current/tutorial.html#tut_universal

set -U fish_user_paths /usr/local/opt/sqlite/bin $fish_user_paths
set -U fish_user_paths /usr/local/sbin $fish_user_paths
set -U fish_user_paths /usr/local/opt/openssl/bin $fish_user_paths

# EDITOR DEFAULT
set -Ux EDITOR "code"

# HOME PROJETOS
set -Ux PROJETOS "$HOME/projetos"

# NODE
set -U fish_user_paths ./node_modules/.bin $fish_user_paths
# set -U NVM_DIR "$HOME/.nvm"

# GOLANG
set -Ux GOPATH "$PROJETOS/go"
set -Ux GOBIN "$GOPATH/bin"
set -U fish_user_paths $GOPATH/bin $fish_user_paths

# PYTHON
set -Ux PIP_DOWNLOAD_CACHE "$HOME/Library/Caches/pip-downloads"
set -Ux PYTHONUNBUFFERED 1
set -Ux PIP_REQUIRE_VIRTUALENV true
set -U VIRTUALFISH_PLUGINS "auto_activation compat_aliases"
set -U VIRTUALFISH_COMPAT_ALIASES
set -Ux VIRTUALENVWRAPPER_SCRIPT /usr/local/bin/virtualenvwrapper.sh
set -Ux VIRTUALENVWRAPPER_HOOK_DIR "$HOME/.virtualenvs"
set -Ux WORKON_HOME $VIRTUALENVWRAPPER_HOOK_DIR

# Python (poetry)
set -U fish_user_paths $HOME/.poetry/bin $fish_user_paths

# Ruby (rvm)
# set -U fish_user_paths $HOME/.rvm/bin $fish_user_paths

# Locale
set -Ux LC_ALL en_US.UTF-8
set -Ux LANG en_US.UTF-8
