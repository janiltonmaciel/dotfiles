# thx to https://github.com/mduvall/config/

function killf
  if ps -ef | sed 1d | fzf -m | awk '{print $2}' > $TMPDIR/fzf.result
    kill -9 (cat $TMPDIR/fzf.result)
  end
end


function gz --d "Get the gzipped size"
  echo "orig size    (bytes): "
  cat "$argv[1]" | wc -c | gnumfmt --grouping
  echo "gzipped size (bytes): "
  gzip -c "$argv[1]" | wc -c | gnumfmt --grouping
end

function sudo!!
    eval sudo $history[1]
end


# `shellswitch [bash|zsh|fish]`
function shellswitch
	chsh -s (brew --prefix)/bin/$argv
end


function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

function server -d 'Start a HTTP server in the current dir, optionally specifying the port'
    if test $argv[1]
        set port $argv[1]
    else
        set port 8000
    end

    open "http://localhost:$port/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
#     python -c "import SimpleHTTPServer
# map = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;
# map[\"\"] = \"text/plain\";
# for key, value in map.items():
#   map[key] = value + \";charset=UTF-8\";
#   SimpleHTTPServer.test()" $port
    statikk --port "$port" .
end


function emptytrash -d 'Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage'
    sudo rm -rfv "/Volumes/*/.Trashes"
    grm -rf "~/.Trash/*"
    rm -rfv "~/Library/Application Support/Spotify/PersistentCache/Update/*.tbz"
    rm -rfv ~/Library/Caches/com.spotify.client/Data
    rm -rfv ~/Library/Caches/Firefox/Profiles/98ne80k7.dev-edition-default/cache2
end


function lsd -d 'List only directories (in the current dir)'
    command ls -d */ | sed -Ee 's,/+$,,'
end


function cleanpycs
    find . -name '.git' -prune -o -name '__pycache__' -delete
    find . -name '.git' -prune -o -name '*.py[co]' -delete
end

function cleanorigs
    find . '(' -name '*.orig' -o -name '*.BACKUP.*' -o -name '*.BASE.*' -o -name '*.LOCAL.*' -o -name '*.REMOTE.*' ')' -print0 | xargs -0 rm -f
end

function cleandsstores
    find . -name '.DS_Store' -exec rm -f '{}' ';'
end


function rmf --description "Remove force (unlink) the FILE(s)"
	grm --interactive --verbose -f $argv
end

# function mysql --description "Alias docker mysql"
#     docker container run -it \
#         mysql:5.7 mysql -h host.docker.internal $argv
# end
