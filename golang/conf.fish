set -Ux GOPATH "$PROJETOS/go"
set -Ux GOBIN "$GOPATH/bin"

# GOLANG
remove_add_user_path $GOPATH/bin
