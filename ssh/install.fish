#!/usr/bin/env fish

link_file $DOTFILES/ssh/config $HOME/.ssh/config backup
	or abort_echo "ssh"
