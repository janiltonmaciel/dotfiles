function aws-credentials --description "AWS Credentials"
	if not set -q argv[1]
		echo (set_color red)">> First argument need to be a profile name." >&2
		return 1
	end
    set -l AWS_PROFILE_NAME $argv[1]
    set -l LOGADO (aws sts get-caller-identity --profile $AWS_PROFILE_NAME | jq -r '.UserId')
    if test -z $LOGADO
          echo "AWS Login with profile $AWS_PROFILE_NAME..."
          aws sso login --profile $AWS_PROFILE_NAME
    end
    aws configure export-credentials --profile $AWS_PROFILE_NAME --format env
end
