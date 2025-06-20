#!/usr/bin/env fish

link_file $DOTFILES/bash/aliases.bash $HOME/.aliases.bash backup
	or abort_echo ".aliases.bash"

link_file $DOTFILES/bash/exports.bash $HOME/.exports.bash backup
	or abort_echo ".exports.bash"

link_file $DOTFILES/bash/functions.bash $HOME/.functions.bash backup
	or abort_echo ".functions.bash"

link_file $DOTFILES/bash/fzf.bash $HOME/.fzf.bash backup
	or abort_echo ".fzf.bash"

link_file $DOTFILES/bash/bashrc $HOME/.bashrc backup
	or abort_echo ".bashrc"

link_file $DOTFILES/bash/bash_prompt $HOME/.bash_prompt backup
	or abort_echo ".bash_prompt"

link_file $DOTFILES/bash/bash_profile $HOME/.bash_profile backup
	or abort_echo ".bash_profile"
