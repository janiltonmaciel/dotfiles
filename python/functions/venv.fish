function venv --argument-names 'python_version' --description 'Create virtualenv named the same as current directory'
  set -l python_bin

  # if not test -n "$python_version"
    # Use default python version set by asdf
  set python_bin (asdf which python)
  # else
    # set python_bin $ASDF_DIR/installs/python/$python_version/bin/python
  # end
  # /Users/janilton/.asdf/installs/python/3.10.12/bin/python
# /Users/janilton/.asdf/installs/python/2.7.18
# /Users/janilton/.asdf/installs/python/2.7.18/bin/python
# /Users/janilton/.asdf/installs/python/2.7.18/bin/python
  set -l venv_name (basename $PWD | tr . -)

  if not test -e $python_bin
    echo "Python version `$python_version` is not installed: `$python_bin`"
    return 1
  end

  echo Creating virtualenv `$venv_name`
  $python_bin -m venv $HOME/.virtualenvs/$venv_name
  source $HOME/.virtualenvs/$venv_name/bin/activate.fish
end
