function emptytrash --description 'Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage'
	sudo rm -rfv "/Volumes/*/.Trashes"
    grm -rf "~/.Trash/*"
    rm -rfv "~/Library/Application Support/Spotify/PersistentCache/Update/*.tbz"
    rm -rfv ~/Library/Caches/com.spotify.client/Data
    rm -rfv ~/Library/Caches/Firefox/Profiles/98ne80k7.dev-edition-default/cache2
end
