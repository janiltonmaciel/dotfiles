#!/usr/bin/env fish

# bootstrap installs things.

set DOTFILES_ROOT (pwd -P)

function on_exit -p %self
	if not contains $argv[3] 0
		echo [(set_color --bold red) FAIL (set_color normal)] "Couldn't setup dotfiles"
	end
end

function info
	echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function user
	echo [(set_color --bold) ' ?? ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function abort
	echo [(set_color --bold yellow) ABRT (set_color normal)] $argv
	exit 1
end

function link_file -d "links a file keeping a backup"
	set -l old $argv[1]
	set -l new $argv[2]
	set -l backup $argv[3]
	# echo $argv | read -l old new backup
	if test -e $new
		set newf (readlink $new)
		if test "$newf" = "$old"
			success "skipped $new -> $old"
			return
		else
			mv $new $new.$backup
				and success "moved $new to $new.$backup"
				or abort "failed to backup $new to $new.$backup"
		end
	end
	mkdir -p (dirname $new)
		and ln -sf $old $new
		and success "linked $new -> $old"
		or abort "could not link $new -> $old"
end


function setup_init
	set -Ux PROJETOS "$HOME/projetos"
	set -Ux DOTFILES "$HOME/.dotfiles"
	set -Ux BREW_PREFIX (brew --prefix)

	mkdir -p $HOME/.config/fish/functions
		and success 'fish functions'
		or abort 'fish functions'

	for src in $DOTFILES/*/functions.symlink/*.fish
		link_file $src $HOME/.config/fish/functions/(basename $src) backup
			or abort 'failed to link'
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
			or abort "please inform the git author email"

		git config --global user.name $user_name
			and git config --global user.email $user_email
			or abort 'failed to setup git user name and email'
	else if test '$managed' = "true"
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		set user_name (git config --global --get user.name)
			and set user_email (git config --global --get user.email)
			and mv ~/.gitconfig ~/.gitconfig.backup
			and git config --global user.name $user_name
			and git config --global user.email $user_email
			and success "moved ~/.gitconfig to ~/.gitconfig.backup"
			or abort 'failed to setup git user name and email'
	else
		# otherwise this gitconfig was already made by the dotfiles
		info_echo "git config already managed by dotfiles"
	end
	# include the gitconfig.local file
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global include.path ~/.gitconfig.local
		and git config --global dotfiles.managed true
		or abort 'failed to setup git'
end

function setup_conf
	for f in $DOTFILES_ROOT/*/conf.fish
		source $f
	end
end

function setup_install
	for installer in */install.fish
		$installer
			and success $installer
			or abort $installer
	end
end


function setup_private
	$DOTFILES_ROOT/private.fish
end

setup_init
	and success 'setup init'
	or abort 'setup init'

setup_gitconfig
	and success 'setup git'
	or abort 'setup git'

setup_conf
	and success 'setup conf'
	or abort 'setup conf'

setup_install
	and success 'setup install'
	or abort 'setup install'

setup_private
	and success 'setup private'
	or abort 'setup private'

if ! grep (command -v fish) /etc/shells
	command -v fish | sudo tee -a /etc/shells
		and success 'added fish to /etc/shells'
		or abort 'setup /etc/shells'
	echo
end

test (which fish) = $SHELL
	and success 'dotfiles installed/updated!'
	and exit 0

chsh -s (which fish)
	and success set (fish --version) as the default shell
	or abort 'set fish as default shell'

success 'dotfiles installed/updated!'
