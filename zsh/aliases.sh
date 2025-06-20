
# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

# Networking. IP address, dig, DNS
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# copy working directory
alias cwd='pwd | tr -d "\r\n" | pbcopy'

#alias wget="curl -O"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Shortcuts
alias g="git"

# File size
alias fs="stat -f \"%z bytes\""

alias reset_audio="sudo killall coreaudiod"

# remove todo os containers que foram finalizado e criados "sem uso"
alias drmall='docker container rm (docker container ls -q -f status=exited -f status=created) 2>/dev/null'

# entra no último container criado usando bash
alias dxclbash='docker container exec -it (docker container ls -l -q) /bin/bash'

# entra no último container criado usando ash (alpine)
alias dxclash='docker container exec -it (docker container ls -l -q) /bin/ash'

# lista todas as images dangling (normalmente com error no build)
# dangling: An unused image means that it has not been assigned or used in a container
alias dilsd='docker image ls -f dangling=true'

# remove todas as images dangling (normalmente com error no build)
alias dirmd='docker image rm (docker image ls -q -f dangling=true) 2>/dev/null'

