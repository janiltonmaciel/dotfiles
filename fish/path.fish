
# set -gx VIRTUALFISH_COMPAT_ALIASES
#set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home"
set -gx PROJETOS "$HOME/projetos"

set -gx PATH /usr/local/bin
append-to-path /usr/local/sbin
append-to-path /bin
append-to-path /sbin
append-to-path /usr/bin
append-to-path /usr/sbin

# NODE
# set -gx PATH $PATH ./node_modules/.bin
# set -gx NVM_DIR ~/.nvm

# GOLANGs
set -gx GOPATH $PROJETOS/go
set -gx GOBIN $GOPATH/bin
append-to-path $GOPATH/bin

# ANDROID
#set -gx ANDROID_HOME ~/Library/Android/sdk
#append-to-path $ANDROID_HOME/tools
#append-to-path $ANDROID_HOME/platform-tools
#append-to-path $ANDROID_HOME/build-tools

set -gx PIP_DOWNLOAD_CACHE ~/Library/Caches/pip-downloads
set -gx PYTHONUNBUFFERED x

set -gx HOMEBREW_NO_ANALYTICS 1

set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# set -gx VIRTUALENVWRAPPER_SCRIPT /usr/local/bin/virtualenvwrapper.sh
# set -gx VIRTUALENVWRAPPER_HOOK_DIR ~/.virtualenvs


##### OLD ########
# MySQL
#append-to-path /usr/local/Cellar/mysql@5.6/5.6.38/bin

# Ruby (rvm)
#append-to-path $HOME/.rvm/bin
