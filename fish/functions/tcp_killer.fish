# netstat -lanW | grep 61613
# lsof -ni TCP | grep 61613
# tcpdump -i lo0 port 61613
function tcp_killer --description 'kill tcp socket'
	workon tcp_killer
	sudo python $DOTFILES/scripts/tcp_killer.py $argv
end
