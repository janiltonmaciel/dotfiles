# Easier navigation: .., ..., ~ and -
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
# function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

alias chmox='chmod +x'

alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget

alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

alias push="git push"

alias ag='ag --follow --hidden'

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
alias localip="sudo ifconfig | command grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | command grep -Eo '([0-9]*\\.){3}[0-9]*' | command grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | command grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | command awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\\: .*|GET \\/.*\""

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# copy working directory
alias cwd='pwd | tr -d "\r\n" | pbcopy'


# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Shortcuts
alias ungz="gunzip -k"
alias c clear

# File size
alias fs="stat -f \"%z bytes\""

# emptytrash written as a function

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle; brew cleanup; brew cleanup --prune-prefix; brew doctor"

alias reset_sound="sudo killall coreaudiod"

