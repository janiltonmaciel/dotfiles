function enabled-rvm --description "Habilitar rvm (ruby)"
    set -g rvm_project_rvmrc 1
    __check_rvm
end
