function gc-work --description "Work git config"
	set -l git_config_path (pwd)/.git/config
	[ -f "$git_config_path" ]; or return

	set -l git_user_mail (git config user.email)
	[ -z "$git_user_mail" ]; or return

	echo -e "\n[include]\n    path = ~/.gitconfig-work" >> $git_config_path
	echo -e "\nDone."
end
