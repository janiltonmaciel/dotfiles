function venv_create --argument-names 'name_env' --description 'Create virtualenv named the same as current directory'

  set venv_name (basename $PWD | tr . -)
  if test -n "$name_env"
  	set venv_name $name_env
  end

#   set python_bin (asdf which python)
  set -l python_bin (mise which python)
  if not test -e $python_bin
    echo "Python version `$python_version` is not installed: `$python_bin`"
    return 1
  end

  echo Creating virtualenv `$venv_name`
  $python_bin -m venv $HOME/.virtualenvs/$venv_name
  venv_activate $venv_name
#   source $HOME/.virtualenvs/$venv_name/bin/activate.fish
end
