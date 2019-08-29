
function godata --description "Entra no diretório do store e habilita ruby/node"
	cd $PROJETOS/globo/backstage/data
    rvm use
    nvm use 10.14.1
end
