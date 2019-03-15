
function store --description "Entra no diretório do store e habilita ruby/node"
	cd $PROJETOS/globo/backstage-store
    nvm use default    
    rvm use 2.3.0
    workon store
end
