#!/usr/bin/env fish

mkdir -p ~/.config/fish/completions/
	and success_echo 'fish completions'
	or abort_echo 'fish completions'

set -Ux EDITOR "code"
set -Ux CURL_CA_BUNDLE "$HOME/.curl/curl-ca-bundle.crt"

# SQL LITE
remove_add_user_path /usr/local/opt/sqlite/bin

# JAVA
remove_add_user_path /usr/local/opt/openjdk/bin

# OPEN SSL
remove_add_user_path /usr/local/opt/openssl/bin

# LOCAL SBIN
remove_add_user_path /usr/local/sbin

# CURL SSL
# remove_add_user_path /usr/local/opt/curl-openssl/bin

# LOCAL BIN
remove_add_user_path /usr/local/bin

link_file $DOTFILES/fish/dotfiles.fish ~/.config/fish/conf.d/dotfiles.fish backup
	or abort_echo 'failed to link fish config file'
