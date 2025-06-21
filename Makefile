setup/fish:
	@echo "Setup dotfiles fish..."
	@./bootstrap.fish
	# @echo "Setup private..."
	# @./private.fish

setup/zsh:
	@echo "Setup dotfiles zsh..."
	@./bootstrap.sh
# @echo "Setup private..."
w# @./private.sh

setup/brew:
	@echo "Setup brew..."
	@./brew/brew.sh
	@echo "Setup brew cask..."
	@./brew/brew-cask.sh
