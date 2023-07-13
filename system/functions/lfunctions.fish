
function lfunctions --description "Lista as principais functions"
	functions | tr -s ',' '\n' | egrep -v "(^omf|^fish|^fzf|^git_|^brew\$|^alias\$|^c\$|^N_\$|^abbr\$|^abort_echo\$|^add_user_path\$|^assert\$|^assert.error_message\$|^assert.expand_operator\$|^autoload\$|^available\$|^bass\$|^bg\$|^bobthefish_display_colors\$|^c\$|^cd\$|^cdh\$|^certp\$|^contains_seq\$|^cp\$|^dirs\$|^disown\$|^down-or-search\$|^edit_command_buffer\$|^envsource\$|^export\$|^f\$|^fg\$|^gr\$|^grep\$|^help\$|^history\$|^info_echo\$|^isatty\$|^kill\$|^killf\$|^la\$|^link_file\$|^ll\$|^ls\$|^man\$|^mv\$|^nextd\$|^open\$|^popd\$|^prompt_hostname\$|^prompt_login\$|^prompt_pwd\$|^prompt_segments\$|^psub\$|^pubkey\$|^pushd\$|^realpath\$|^refresh\$|^remove_add_user_path\$|^require\$|^rmf\$|^setenv\$|^success_echo\$|^suspend\$|^trap\$|^umask\$|^up-or-search\$|^user_echo\$|^vared\$|^whichlink\$|^z\$|^zi\$|^remove_user_path\$|^remove_add_user_path\$)"
end


