function aws
	# echo "PWD: $PWD"
	docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli -v $PWD:/aws $argv
end
