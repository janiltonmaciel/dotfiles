
# DOCKER 
# https://bobcares.com/blog/how-to-clear-docker-cache-and-save-disk-space/2/

alias d docker
alias dm docker-machine
alias dc docker-compose

alias dcls 'docker container ls'
alias dclsa 'docker container ls -a'
alias dclse 'docker container ls -f status=exited'
alias dcrme 'docker container rm (docker container ls -q -f status=exited)'
alias dcexecl 'docker container exec -ti (docker -a -q -l) /bin/bash'
# alias dcexecl 'docker container exec -ti ( docker x` -a -q -l) /bin/bash'
alias dcichild "docker inspect --format='{{.Id}} {{.Parent}}' (docker images --filter since=307767e90d0d --quiet)"

alias dils 'docker image ls'
alias dilsa 'docker image ls -a'
alias dilsd 'docker image ls -f dangling=true'
alias dirmd 'docker image rm (docker image ls -q -f dangling=true)'

function dma -d 'Ativa o docker-machine ao ambiente'
    if test (count $argv) -gt 0
        eval (docker-machine env docker-sandbox-1)
    else
        echo "Informe o nome do docker machine: "
        command docker-machine ls
    end
end

function docker-get-id
  # Usage: docker-get-id (friendly-name)
  docker inspect --format "{{ .ID }}" "$argv"
end

# function docker-memory {
#   for line in `docker ps | awk '{print $1}' | grep -v CONTAINER`; do docker ps | grep $line | awk '{printf $NF" "}' && echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; done
# }
# # backup files from a docker volume into /tmp/backup.tar.gz
# function docker-volume-backup-compressed() {
#   docker container run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie tar -czvf /backup/backup.tar.gz "${@:2}"
# }
# # restore files from /tmp/backup.tar.gz into a docker volume
# function docker-volume-restore-compressed() {
#   docker container run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie tar -xzvf /backup/backup.tar.gz "${@:2}"
#   echo "Double checking files..."
#   docker container run --rm -v /tmp:/backup --volumes-from "$1" debian:jessie ls -lh "${@:2}"
# }
# # backup files from a docker volume into /tmp/backup.tar
# function docker-volume-backup() {
#   docker container run --rm -v /tmp:/backup --volumes-from "$1" busybox tar -cvf /backup/backup.tar "${@:2}"
# }
# # restore files from /tmp/backup.tar into a docker volume
# function docker-volume-restore() {
#   docker container run --rm -v /tmp:/backup --volumes-from "$1" busybox tar -xvf /backup/backup.tar "${@:2}"
#   echo "Double checking files..."
#   docker container run --rm -v /tmp:/backup --volumes-from "$1" busybox ls -lh "${@:2}"
# }