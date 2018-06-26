function clone --description 'Clone repository and cd into it'
    set -l dir ''
    switch (count $argv)
        case 1
            set dir (string split -m 1 -r "." (command basename -- $argv[1]))[1]
        case 2
            set dir $argv[2]
    end

    git clone $argv

    if test $status = 0
        if test -d $dir
            cd $dir
        end
    end

end
