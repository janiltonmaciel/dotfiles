if ! command -v code >/dev/null 2>&1; then
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  vscode_home="$HOME/Library/Application Support/Code"
else
  vscode_home="$HOME/.config/Code"
fi

mkdir -p "$vscode_home" \
  && success_echo 'vscode home' \
  || abort_echo 'vscode home'

link_file "$DOTFILES/vscode/settings.json" "$vscode_home/User/settings.json"