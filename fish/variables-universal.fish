#!/usr/bin/env fish

function set_export_universal
	set -Ux $argv[1] $argv[2]
	success_echo "> export $argv[1]=$argv[2]"
end

set_export_universal EDITOR "code"


# set_export_universal PYCURL_SSL_LIBRARY "openssl"
# set_export_universal LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
# set_export_universal CFLAGS "-I/usr/local/opt/openssl@1.1/include"
