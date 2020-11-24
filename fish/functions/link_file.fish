function link_file -d "links a file keeping a backup"
	set -l old $argv[1]
	set -l new $argv[2]
	set -l backup $argv[3]
	# echo $argv | read -l old new backup
	if test -e $new
		set newf (readlink $new)
		if test "$newf" = "$old"
			success_echo "skipped $new -> $old"
			return
		else
			mv $new $new.$backup
				and success_echo "moved $new to $new.$backup"
				or abort "failed to backup $new to $new.$backup"
		end
	end
	mkdir -p (dirname $new)
		and ln -sf $old $new
		and success_echo "linked $new -> $old"
		or abort "could not link $new -> $old"
end
