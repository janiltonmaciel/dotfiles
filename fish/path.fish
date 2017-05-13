
# Grab my $PATHs from ~/.extra
set -l PATH_DIRS (cat "$HOME/.extra" | grep "^PATH" | \
    # clean up bash PATH setting pattern
    sed "s/PATH=//" | sed "s/\\\$PATH://" | \
    # rewrite ~/ to use {$HOME}
    sed "s/~\//{\$HOME}\//")


set -l PA ""

for entry in (string split \n $PATH_DIRS)
    # resolve the {$HOME} substitutions
    set -l resolved_path (eval echo $entry)
    if test -d "$resolved_path"; # and not contains $resolved_path $PATH
        set PA $PA "$resolved_path"
    end
end

# # rvm
# if which -s rvm;
# 	set PA $PA /Users/paulirish/.rvm/gems/ruby-2.2.1/bin
# end

# yarn binary
set PA $PA "$HOME/.yarn/bin"

# yarn global modules (hack for me)
set PA $PA "$HOME/.homebrew/Cellar/node/7.10.0/bin"
set PA $PA "$HOME/.homebrew/Cellar/node/7.7.1_1/bin"

# Google Cloud SDK.
[ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"


set --export PATH $PA