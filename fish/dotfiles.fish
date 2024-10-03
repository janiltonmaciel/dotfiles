source $DOTFILES/fish/theme.fish

if status is-interactive

	for f in $DOTFILES/*/functions
		set -p fish_function_path $f
	end

	# enabled ASDF
    # Commands to run in interactive sessions can go here
	# source $BREW_PREFIX/opt/asdf/asdf.fish # source (brew --prefix asdf)/asdf.fish
	source $BREW_PREFIX/opt/asdf/libexec/asdf.fish
	# set -gx ASDF_SKIM_RESHIM 0

	# zoxide is a smarter cd command, inspired by z and autojump.
	zoxide init fish | source

	export GPG_TTY=$(tty)
	# jenv init - | source

	# load-gcloud
end
