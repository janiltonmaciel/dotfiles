#!/usr/bin/env fish

# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)

function on_exit -p %self
	if not contains $argv[3] 0
		echo [(set_color --bold red) FAIL (set_color normal)] "Couldn't setup dotfiles"
	end
end

function setup_gitconfig
	set managed (git config --global --get dotfiles.managed)
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if test -z (git config --global --get user.email)
		user_echo 'What is your github author name?'
		read user_name
		user_echo 'What is your github author email?'
		read user_email

		test -n $user_name
			or echo "please inform the git author name"
		test -n $user_email
			or abort_echo "please inform the git author email"

		git config --global user.name $user_name
			and git config --global user.email $user_email
			or abort_echo 'failed to setup git user name and email'
	else if test '$managed' = "true"
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		set user_name (git config --global --get user.name)
			and set user_email (git config --global --get user.email)
			and mv ~/.gitconfig ~/.gitconfig.backup
			and git config --global user.name $user_name
			and git config --global user.email $user_email
			and success_echo "moved ~/.gitconfig to ~/.gitconfig.backup"
			or abort_echo 'failed to setup git user name and email'
	else
		# otherwise this gitconfig was already made by the dotfiles
		info_echo "git config already managed by dotfiles"
	end
	# include the gitconfig.local file
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global include.path ~/.gitconfig.local
		and git config --global dotfiles.managed true
		or abort_echo 'failed to setup git'
end

function setup
	set -Ux PROJETOS "$HOME/projetos"
	set -Ux DOTFILES "$HOME/.dotfiles"
	set -Ux BREW_PREFIX (brew --prefix)

	ln -sf "$DOTFILES_ROOT/fish/functions" "$HOME/.config/fish"
		and success_echo "linked $HOME/.config/fish/functions -> $DOTFILES_ROOT/fish/functions"
		or echo "fish functions error"

	for f in $DOTFILES_ROOT/*/conf.fish
		source $f
	end

	for installer in */install.fish
		$installer
			and success_echo $installer
			or abort_echo $installer
	end
end

function setup_private
	cd $HOME/Dropbox/Local && ./script/bootstrap.fish
end

setup_gitconfig
	and success_echo 'setup git'
	or abort_echo 'setup git'

setup
	and success_echo 'setup'
	or abort_echo 'setup'

setup_private
	and success_echo 'setup private'
	or abort_echo 'setup private'

if ! grep (command -v fish) /etc/shells
	command -v fish | sudo tee -a /etc/shells
		and success_echo 'added fish to /etc/shells'
		or abort_echo 'setup /etc/shells'
	echo
end

test (which fish) = $SHELL
	and success_echo 'dotfiles installed/updated!'
	and exit 0

chsh -s (which fish)
	and success_echo set (fish --version) as the default shell
	or abort_echo 'set fish as default shell'

success_echo 'dotfiles installed/updated!'
