function cleandsstores
	find . -name '.DS_Store' -exec rm -f '{}' ';'
end
