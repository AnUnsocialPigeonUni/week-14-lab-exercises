#! /usr/bin/env bash

#Create VPC 10.0.0.0/22

if [[ -z "${STUDENT_NAME}" ]]; then
  echo "STUDENT_NAME is not set"
  echo "Please run the command \"export STUDENT_NAME={desired name}\""
  exit 1
fi

readonly STACK_NAME="${STUDENT_NAME}-networking"
readonly TEMPLATE_FILE="$(dirname "${BASH_SOURCE[0]}")/templates/networking.yml"
readonly AWS_DEFAULT_REGION="eu-west-2"

echo $NETWORKING_PARAMS_FILE_DIR

echo "cloud Formation Deploying"
aws cloudformation deploy \
  --stack-name "${STACK_NAME}" \
  --template-file "${TEMPLATE_FILE}" \
  --capabilities CAPABILITY_IAM \
  --no-fail-on-empty-changeset \
  --tags "Project=Confuzzled" "Environment=Dev" "StudentName=${STUDENT_NAME}" "JakeTearDown=True" \
  --region "${AWS_DEFAULT_REGION}" \
  --parameter-overrides \
      "VpcCidr=10.0.0.0/24" \
      "PubSubnetACidr=10.0.0.0/26" \
      "StudentName=JAKE" 

echo "cloud Formation Deploying 2"
