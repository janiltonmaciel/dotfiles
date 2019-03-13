#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names
brew install xclip

# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install bash-completion

brew install homebrew/completions/brew-cask-completion

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
# brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# z hopping around folders
brew install z

# run this script when this file changes guy.
brew install entr

# mtr - ping & traceroute. best.
brew install mtr
# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//')
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr



# Record and share your terminal sessions
brew install asciinema

# Install other useful binaries
brew install the_silver_searcher
brew install fzf

brew install git
brew install git-lfs
# brew install imagemagick --with-webp
brew install rename
brew install tree
# brew install zopfli
brew install ffmpeg --with-libvpx
brew install ssh-copy-id

# brew install android-platform-tools
# brew install pidcat   # colored logcat guy

brew install ncdu # find where your diskspace went

brew install fish # shellfish


# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install socat

# https://github.com/FiloSottile/mkcert 
brew install mkcert
brew install nss
brew install httpie
brew install jq
brew install wrk

# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install pngcheck
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf

# brew install mysql --client-only

# Remove outdated versions from the cellar
brew cleanup
