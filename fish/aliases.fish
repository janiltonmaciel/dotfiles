
alias ag='ag --follow --hidden'
alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"
alias fupath="echo $fish_user_paths | tr ' ' '\n'"
alias clean_ipython="rm -rf $HOME/.ipython/profile_default/history.sqlite"
alias clean_ds_store="find . -name '.DS_Store' -exec rm -f '{}' ';'"
alias clean_origs="find . '(' -name '*.orig' -o -name '*.BACKUP.*' -o -name '*.BASE.*' -o -name '*.LOCAL.*' -o -name '*.REMOTE.*' ')' -print0 | xargs -0 rm -f"

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

# Shortcuts
alias ungz="gunzip -k"

# File size
alias fs="stat -f \"%z bytes\""

alias reset_sound="sudo killall coreaudiod"

