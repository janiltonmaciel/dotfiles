#!/usr/bin/env fish

# Don't ask ssh password all the time
switch (uname)
case Darwin
	git config --global credential.helper osxkeychain
case '*'
	git config --global credential.helper cache
end

# better diffs
if command -qs delta
	git config --global core.pager delta
	git config --global interactive.diffFilter 'delta --color-only'
	git config --global delta.syntax-theme Dracula
	git config --global delta.line-numbers true
	git config --global delta.decorations true
	git config --global delta.features 'side-by-side line-numbers decorations'
end

# use vscode as mergetool and difftool
if command -qs code
	git config --global merge.tool vscode
		and git config --global mergetool.vscode.cmd "code --wait \$MERGED"
		and git config --global diff.tool vscode
		and git config --global difftool.cmd "code --wait --diff \$LOCAL \$REMOTE"
end

abbr -a gl 'git pull --prune'
abbr -a glog "git log --graph --decorate --oneline --abbrev-commit"
abbr -a gloga "glg --all"
abbr -a gp 'git push origin HEAD'
abbr -a gd 'git diff'
abbr -a gci 'git commit'
abbr -a gco 'git checkout'
abbr -a gb 'git branch -v'
abbr -a gs 'git status -sb'
abbr -a gw 'git switch'


link_file "$DOTFILES/git/gitignore" "$HOME/.gitignore" backup
	or abort_echo ".gitignore"

link_file "$DOTFILES/git/gitconfig.local" "$HOME/.gitconfig.local" backup
	or abort_echo ".gitconfig.local"
