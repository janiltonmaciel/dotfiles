function print-export-aws-credentials --description "Print AWS Credentials"
    set -l AWS_PROFILE_NAME crosstech
    set -l LOGADO (aws sts get-caller-identity --profile $AWS_PROFILE_NAME | jq -r '.UserId')
    if test -z $LOGADO
		  echo "AWS Login with profile $AWS_PROFILE_NAME..."
		  aws sso login --profile $AWS_PROFILE_NAME
    end
    aws configure export-credentials --profile $AWS_PROFILE_NAME --format env
end
