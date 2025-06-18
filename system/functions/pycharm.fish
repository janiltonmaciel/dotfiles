function pycharm --description "Open Pycharm"
  set path $argv[1]

	if test -z $path; or test "$path" = "."
    set path $PWD
  else
    if ! test -d $path
      echo (set_color red)"> Diretório não encontrado: '$path'" >&2
      return 1
    end
	end

  command open -na /Applications/PyCharm\ CE.app --args $path
end
