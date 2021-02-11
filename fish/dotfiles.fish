source $DOTFILES/fish/theme.fish

for f in $DOTFILES/*/functions
	set -p fish_function_path $f
end

# enabled ASDF
source $BREW_PREFIX/opt/asdf/asdf.fish # source (brew --prefix asdf)/asdf.fish
set -gx ASDF_SKIM_RESHIM 1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/janilton/google-cloud-sdk/path.fish.inc' ]; . '/Users/janilton/google-cloud-sdk/path.fish.inc'; end
