
function myip --description "Export "
	set -gx MYIP (ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)
    echo $MYIP
end
