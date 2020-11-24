#!/usr/bin/env fish

if test -d ~/.local/share/omf
	success_echo 'omf'
else
	curl -L https://get.oh-my.fish | fish
		and success_echo 'omf'
		or abort_echo 'omf'
end
