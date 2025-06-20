function remove_user_path
	for name in $argv
		set -l index 1
		for up in $fish_user_paths
			if test $name = $up
				set -e fish_user_paths[$index]
				break
			end
			set index (math $index +1)
		end
	end
end
