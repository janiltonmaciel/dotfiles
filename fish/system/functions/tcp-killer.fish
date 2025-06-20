# netstat -lanW | grep 61613
# lsof -ni TCP | grep 61613
# tcpdump -i lo0 port 61613
function tcp-killer --description 'kill tcp socket'
	#ex: tcp-killer ::1.56859 ::1.61613
	vf activate tcp-killer
	sudo python $DOTFILES/script/tcp-killer.py $argv
end
