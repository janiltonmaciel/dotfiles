
setup_gitconfig() {
  local managed
  managed=$(git config --global --get dotfiles.managed)

  # Se não existe user.email, assume novo setup e pede os dados
  if [ -z "$(git config --global --get user.email)" ]; then
    echo "What is your github author name?"
    read -r user_name
    echo "What is your github author email?"
    read -r user_email

    if [ -z "$user_name" ]; then
      echo "please inform the git author name"
      return 1
    fi
    if [ -z "$user_email" ]; then
      abort_echo "please inform the git author email"
    fi

    git config --global user.name "$user_name" \
      && git config --global user.email "$user_email" \
      || abort_echo "failed to setup git user name and email"
  elif [ "$managed" = "true" ]; then
    # Se user.email existe e dotfiles.managed é true, faz backup e restaura configs
    user_name=$(git config --global --get user.name)
    user_email=$(git config --global --get user.email)
    mv ~/.gitconfig ~/.gitconfig.backup \
      && git config --global user.name "$user_name" \
      && git config --global user.email "$user_email" \
      && success_echo "moved ~/.gitconfig to ~/.gitconfig.backup" \
      || abort_echo "failed to setup git user name and email"
  else
    # Caso contrário, já está gerenciado
    echo "git config already managed by dotfiles"
  fi

  # Inclui o gitconfig.local e marca como gerenciado
  git config --global include.path ~/.gitconfig.local \
    && git config --global dotfiles.managed true \
    || abort_echo "failed to setup git"
}


setup_gitconfig || abort_echo "Failed to setup git config"


# Não pedir senha do ssh toda hora
if [ "$(uname)" = "Darwin" ]; then
  git config --global credential.helper osxkeychain
else
  git config --global credential.helper cache
fi

# better diffs
if command -v delta >/dev/null 2>&1; then
  git config --global core.pager delta
  git config --global interactive.diffFilter 'delta --color-only'
  git config --global delta.syntax-theme Dracula
  git config --global delta.line-numbers true
  git config --global delta.decorations true
  git config --global delta.features 'side-by-side line-numbers decorations'
fi

# use vscode as mergetool and difftool
if command -v code >/dev/null 2>&1; then
  git config --global merge.tool vscode
  git config --global mergetool.vscode.cmd "code --wait \$MERGED"
  git config --global diff.tool vscode
  git config --global difftool.cmd "code --wait --diff \$LOCAL \$REMOTE"
fi

link_file "$DOTFILES_ROOT/git/gitignore" "$HOME/.gitignore" backup || abort_echo ".gitignore"
link_file "$DOTFILES_ROOT/git/gitconfig.local" "$HOME/.gitconfig.local" backup