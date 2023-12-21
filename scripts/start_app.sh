#! /bin/bash

# Env
# Enter you AWS account ID and region
AWS_DEFAULT_REGION=''
AWS_ACCOUNT_ID=''

# ECR login
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"

# pull the new image
docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/xtb-mo-st-app:latest

# run the container
docker run -d -p 8501:8501 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/xtb-mo-st-app:latest