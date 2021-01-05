setup:
	@echo "Setup dotfiles..."
	@./script/bootstrap.fish

setup-private:
	@echo "Setup private..."
	@./private.fish

setup-brew:
	@echo "Setup brew..."
	@./brew/brew.sh
	@echo "Setup brew cask..."
	@./brew/brew-cask.sh

setup-macos:
	@echo "Setup macOS..."
	@./macos/set-defaults.sh

