# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

alias chmox='chmod -x'

alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget

alias ag='ag -f --hidden'

###
# time to upgrade `ls`

# use coreutils `ls` if possible…
hash gls >/dev/null 2>&1 || alias gls="ls"

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
# alias ls='gls -AFh ${colorflag} --group-directories-first'
alias lsd='ls -l | grep "^d"' # only directories
#    `la` defined in .functions
###



###
# GIT STUFF

alias push="git push"

# git root
#alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'
alias master="git checkout master"

# Networking. IP address, dig, DNS
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\\: .*|GET \\/.*\""

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# copy working directory
alias cwd='pwd | tr -d "\r\n" | pbcopy'

# alias dig="dig +nocmd any +multiline +noall +answer"
# wget sucks with certificates. Let's keep it simple.
#alias wget="curl -O"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Shortcuts
alias g="git"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage
alias emptytrash=" \
    sudo rm -rfv /Volumes/*/.Trashes; \
    rm -rfv ~/.Trash/*; \
    sudo rm -v /private/var/vm/sleepimage \
"

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor"

alias reset_audio="sudo killall coreaudiod"


alias d='docker'
alias dm='docker-machine'
alias dc='docker-compose'

# lista os containers em uso
alias dcls='docker container ls'

# lista todos os containers
alias dclsa='docker container ls -a'

# lista todos os containers com status=exited
alias dclse='docker container ls -f status=exited'

# remove todo os containers que foram finalizado e criados "sem uso"
alias dcrm='docker container rm (docker container ls -q -f status=exited -f status=created) 2>/dev/null'

# entra no último container criado usando bash
alias dcexec='docker container exec -it (docker container ls -l -q) /bin/bash'

# entra no último container criado usando ash (alpine)
alias dcexeca='docker container exec -it (docker container ls -l -q) /bin/ash'

# executa e entra num container node
alias dcnode='docker container run --rm -it -v (pwd):/app node:8.11-alpine /bin/ash'

# lista todas as images
alias dils='docker image ls'

# lista todas as images e as intermediarias
alias dilsa='docker image ls -a'

# lista todas as images dangling (normalmente com error no build)
# dangling: An unused image means that it has not been assigned or used in a container
alias dilsd='docker image ls -f dangling=true'

# remove todas as images dangling (normalmente com error no build)
alias dirmd='docker image rm (docker image ls -q -f dangling=true) 2>/dev/null'

