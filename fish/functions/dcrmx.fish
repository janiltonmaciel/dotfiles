function dcrmx
    command docker container rm (docker container ls -q -f status=exited -f status=created) 2> /dev/null
end
