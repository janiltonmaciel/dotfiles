function docker-login-aws --description "Docker login in AWS"
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 073521391622.dkr.ecr.us-east-1.amazonaws.com
end
