function ideia --description "Open IntelliJ"
  set path $argv[1]

	if test -z $path; or test "$path" = "."
    set path $PWD
  else
    if ! test -d $path
      echo (set_color red)"> Diretório não encontrado: '$path'" >&2
      return 1
    end
	end

  command open -na /Applications/IntelliJ\ IDEA\ CE.app --args $path
end
