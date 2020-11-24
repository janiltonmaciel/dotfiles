#!/usr/bin/env fish
#
if ! command -qs code
	exit 0
end

switch (uname)
case Darwin
	set vscode_home "$HOME/Library/Application Support/Code"
case '*'
	set vscode_home "$HOME/.config/Code"
end

# mkdir -p $vscode_home
# 	and ln -sf "$DOTFILES/vscode/settings.json" "$vscode_home/User/settings.json"
# 	and ln -sf "$DOTFILES/vscode/keybindings.json" "$vscode_home/User/keybindings.json"
# 	and ln -sf "$DOTFILES/vscode/snippets" "$vscode_home/User"
# 	and echo "vscode: linked config files"

mkdir -p $vscode_home
	and success_echo 'vscode home'
	or abort_echo 'vscode home'

link_file "$DOTFILES/vscode/settings.json" "$vscode_home/User/settings.json" backup
	or abort_echo "vscode settings.json"

link_file "$DOTFILES/vscode/keybindings.json" "$vscode_home/User/keybindings.json" backup
	or abort_echo "vscode keybindings.json"

ln -sf "$DOTFILES/vscode/snippets" "$vscode_home/User"
	or abort_echo "vscode snippets"

cat $DOTFILES/vscode/extensions.txt | while read module
	code --install-extension "$module"
		and success_echo "vscode: $module"
		or abort_echo "vscode: failed to install $module"
end
