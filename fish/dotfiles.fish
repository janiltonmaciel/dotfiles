source $DOTFILES/fish/theme.fish

if status is-interactive

	for f in $DOTFILES/*/functions
		set -p fish_function_path $f
	end

	# enabled ASDF
    # Commands to run in interactive sessions can go here
	# source $BREW_PREFIX/opt/asdf/asdf.fish # source (brew --prefix asdf)/asdf.fish
	source ~/.asdf/asdf.fish
	set -gx ASDF_SKIM_RESHIM 0

	# zoxide is a smarter cd command, inspired by z and autojump.
	zoxide init fish | source

	# jEnv is a command line tool to help you forget how to set the JAVA_HOME environment variable
	jenv init - | source

	# The next line updates PATH for the Google Cloud SDK.
	if [ -f '/Applications/google-cloud-sdk/path.fish.inc' ]; . '/Applications/google-cloud-sdk/path.fish.inc'; end

end
