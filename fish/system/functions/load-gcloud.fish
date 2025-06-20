function load-gcloud --description "The next line updates PATH for the Google Cloud SDK."
	if [ -f '/Applications/google-cloud-sdk/path.fish.inc' ]; . '/Applications/google-cloud-sdk/path.fish.inc'; end
end
