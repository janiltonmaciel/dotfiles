function gc-personal --description "Personal git config"
	set -l git_config_path (pwd)/.git/config
	[ -f "$git_config_path" ]; or return

	set -l git_user_mail (git config user.email)
	[ -z "$git_user_mail" ]; or return

	echo -e "\n[include]\n    path = ~/.gitconfig-personal" >> $git_config_path
	echo -e "\nDone."
end
