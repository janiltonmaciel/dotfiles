#!/usr/bin/env fish

mkdir -p $HOME/.config/htop
	and success_echo 'htop config'
	or abort_echo 'htop config'

link_file "$DOTFILES/htop/htoprc" "$HOME/.config/htop/htoprc" backup
	or abort_echo htoprc

