source ~/.config/fish/theme.fish
# source ~/.config/fish/aliases.fish
# source ~/.config/fish/aliases_docker.fish

# set (l,g,U,x)
# -l, --local: available only to the innermost block
# -g, --global: available outside blocks and by other functions
# -U, --universal: shared between all fish sessions and persisted across restarts of the shell
# -x, --export: available to any child process spawned in the current session

# FZF
set -l FD_OPTIONS "--hidden --follow --exclude .git --exclude node_modules"
set -gx FZF_DEFAULT_COMMAND "git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --preview-window down:1"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND "fd --type d $FD_OPTIONS"


# fnm (node enviroment)
# fnm env --multi | source

if test -d "$BREW_PREFIX/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path $BREW_PREFIX/share/fish/completions
end

if test -d "$BREW_PREFIX/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path $BREW_PREFIX/share/fish/vendor_completions.d
end

# enabled ASDF
source $BREW_PREFIX/opt/asdf/asdf.fish # source (brew --prefix asdf)/asdf.fish
set -gx ASDF_SKIM_RESHIM 1
