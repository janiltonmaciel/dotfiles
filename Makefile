setup:
	@echo "Setup dotfiles..."
	@./script/bootstrap.fish

setup-brew:
	@echo "Setup brew..."
	@./brew/brew.sh
	@echo "Setup brew cask..."
	@./brew/brew-cask.sh


setup-macos:
	@echo "Setup macOS..."
	@./brew/set-defaults.sh
