# This file is part of the dotfiles project
export DOTFILES_ROOT="${DOTFILES_ROOT:-$HOME/.dotfiles}"

# environment variables
source $DOTFILES_ROOT/zsh/exports.sh

# jump Z
eval "$(zoxide init zsh)"

# oh-my-zsh
source $DOTFILES_ROOT/zsh/oh-my-zsh.sh

# aliases
source $DOTFILES_ROOT/zsh/aliases.sh

# functions
source $DOTFILES_ROOT/zsh/functions.sh

# terminal
eval "$(starship init zsh)"
