#!/usr/bin/env fish

set -l FD_OPTIONS "--hidden --follow --exclude .git --exclude node_modules"
set -Ux FZF_DEFAULT_COMMAND "git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
set -Ux FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --preview-window down:1"
set -Ux FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -Ux FZF_ALT_C_COMMAND "fd --type d $FD_OPTIONS"
