function mysql-socket
	socat UNIX-LISTEN:/tmp/mysql.sock,fork,unlink-early TCP:127.0.0.1:3306 > /dev/null 2>&1 &
end
