#!/usr/bin/env fish

link_file "$DOTFILES/editorconfig/editorconfig" "$HOME/.editorconfig" backup
	or abort_echo ".editorconfig"
