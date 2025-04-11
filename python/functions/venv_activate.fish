function venv_activate --argument-names 'name_env' --description 'Active virtualenv named the same as current directory'
  set venv_name (basename $PWD | tr . -)
  if test -n "$name_env"
  	set venv_name $name_env
  end

  if not test -e $HOME/.virtualenvs/$venv_name
	echo "Virtualenv `$venv_name` is not installed"
	return 1
  end

  echo Active virtualenv `$venv_name`
  source $HOME/.virtualenvs/$venv_name/bin/activate.fish
end
