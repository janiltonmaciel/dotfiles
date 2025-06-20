function dcexecl
    command docker container exec -it (docker container ls -l -q) /bin/sh
end
