# netstat -lanW | grep 61613
# lsof -ni TCP | grep 61613
# tcpdump -i lo0 port 61613
function portas
	sudo lsof -i -P $argv;
end
