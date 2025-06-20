function lsd --description 'List only directories (in the current dir)'
	command ls -d */ | sed -Ee 's,/+$,,'
end
