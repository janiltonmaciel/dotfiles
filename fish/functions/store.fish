
function store --description "Entra no diretório do store e habilita ruby/node"
	cd $PROJETOS/globo/backstage/store/backstage-store
    rvm use
    workon store
end
