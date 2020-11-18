function d-irmx
    command docker image rm (docker image ls -q -f dangling=true) 2>/dev/null
end
