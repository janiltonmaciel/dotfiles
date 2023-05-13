function add_user_path
	set -Ua fish_user_paths $argv
	success_echo "> $argv"
end
