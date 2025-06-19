#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update
brew upgrade
brew analytics off

brew install coreutils
brew install moreutils
brew install gnu-sed

# Note: don’t forget to add `/usr/local/bin/<EACHSHELL>` to `/etc/shells` before running `chsh`.
brew install fish
brew install bash
brew install bash-completion

# Install more recent versions of some OS X tools
brew install vim
brew install nano
brew install grep

brew install wget
brew install zoxide # z hopping around folders
brew install mtr # mtr - ping & traceroute. best.
brew install fzf
brew install gh
brew install git-lfs
brew install git-delta
brew install rename
brew install tree
brew install ffmpeg
brew install exa

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install socat
brew install jq
brew install youtube-dl
brew install asdf
brew install curl
brew install watch
brew install janiltonmaciel/tap/statiks

# Remove outdated versions from the cellar
brew cleanup


# brew install openssl@1.0
# brew install openssl@1.1
# brew install csshx
# brew install kubectl
# brew install minikube
# brew install asciidoc
# brew install goreleaser/tap/goreleaser
# brew install sqlite
# brew install htop
# brew install mkcert
# brew install nss
# brew install httpie
# brew install wrk
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

# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
#brew install findutils
# run this script when this file changes guy.
# brew install entr

# # allow mtr to run without sudo
# mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//')
# sudo chmod 4755 $mtrlocation/sbin/mtr
# sudo chown root $mtrlocation/sbin/mtr

# Record and share your terminal sessions
# brew install asciinema

# Install other useful binaries
# brew install the_silver_searcher

# brew install android-platform-tools
# brew install pidcat   # colored logcat guy

# brew install ncdu # find where your diskspace went
