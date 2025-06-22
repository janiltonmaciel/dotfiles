#!/bin/bash

export DOTFILES_ROOT="${DOTFILES_ROOT:-$HOME/.dotfiles}"
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

success_echo() {
  echo -e "\033[1;32m[ OK ]\033[0m $*"
}

abort_echo() {
  echo -e "\033[1;33mABRT\033[0m $*"
  exit 1
}

link_file() {
  local old="$1"
  local new="$2"
  local backup="bkup"

  if [ -e "$new" ]; then
    local newf
    newf=$(readlink "$new")
    if [ "$newf" = "$old" ]; then
      success_echo "SKIPPED $new -> $old"
      return 0
    else
      mv "$new" "$new.$backup" \
        && success_echo "moved $new to $new.$backup" \
        || abort_echo "failed to backup $new to $new.$backup"
    fi
  fi

  mkdir -p "$(dirname "$new")" \
    && ln -sf "$old" "$new" \
    && success_echo "LINKED $new -> $old" \
    || abort_echo "could not link $new -> $old"
}

link_file "$DOTFILES_ROOT/starship/starship.toml" "$HOME/.config/starship.toml"
source zsh/install.sh
source git/install.sh
source ssh/install.sh
source vscode/install.sh
