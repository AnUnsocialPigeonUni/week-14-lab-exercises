#! /usr/bin/env bash

# Deploys the networking stack
if [[ -z "${STUDENT_NAME}" ]]; then
  echo "STUDENT_NAME is not set"
  exit 1
fi

# This script is used to deploy s3 bucket
STACK_NAME="${STUDENT_NAME}-s3-poems-bucket"
TEMPLATE_FILE="$(dirname "${BASH_SOURCE[0]}")/templates/s3.yml"
AWS_DEFAULT_REGION="eu-west-2"
POEMS_BUCKET_NAME="${STUDENT_NAME}-poems-bucket"

echo "cloud Formation Deploying"
aws cloudformation deploy \
  --stack-name "${STACK_NAME}" \
  --template-file "${TEMPLATE_FILE}" \
  --capabilities CAPABILITY_IAM \
  --no-fail-on-empty-changeset \
  --tags "Project=Poems" "Environment=Dev" "StudentName=${STUDENT_NAME}"\
  --region "${AWS_DEFAULT_REGION}" \
  --parameter-overrides \
    "PoemsBucketName=${POEMS_BUCKET_NAME}" \
    "StudentName=${STUDENT_NAME}"

echo "cloud Formation Deployed"


#Set up ec2 ?
echo "Starting user data script"

yum update -y

yum install curl -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

chmod 700 "${HOME}/.nvm/nvm.sh" && "${HOME}/.nvm/nvm.sh"
nvm install v16 && nvm use v16 && npm install -g npm

source "${HOME}/.bashrc"


# Set up s3
set -eo pipefail

if [[ -z "${STUDENT_NAME}" ]]; then
  echo "STUDENT_NAME is not set"
  exit 1
fi