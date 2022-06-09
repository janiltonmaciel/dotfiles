source $DOTFILES/fish/theme.fish

for f in $DOTFILES/*/functions
	set -p fish_function_path $f
end

# enabled ASDF
source $BREW_PREFIX/opt/asdf/asdf.fish # source (brew --prefix asdf)/asdf.fish
set -gx ASDF_SKIM_RESHIM 0

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.fish.inc' ]; . '/Applications/google-cloud-sdk/path.fish.inc'; end

zoxide init fish | source
