#! /usr/bin/env bash

#Create VPC 10.0.0.0/22

if [[ -z "${STUDENT_NAME}" ]]; then
  echo "STUDENT_NAME is not set"
  echo "Please run the command \"execute STUDENT_NAME={desired name}\""
  exit 1
fi
if [! aws sts get-caller-identity]; then
    echo >&2 "aws creds not working"
    exit 2
fi


readonly STACK_NAME="${STUDENT_NAME}-networking"
readonly TEMPLATE_FILE="$(dirname "${BASH_SOURCE[0]}")/templates/networking.yml"
readonly AWS_DEFAULT_REGION="eu-west-2"
readonly UserDataScript=$("${FILE_DIRECTORY}/ec2-setup.sh")

echo "#############################"
echo "#    Starting VPC Setup     #"
echo "#############################"

aws cloudformation deploy \
  --stack-name "${STACK_NAME}" \
  --template-file "${TEMPLATE_FILE}" \
  --capabilities CAPABILITY_IAM \
  --no-fail-on-empty-changeset \
  --tags "Project=Confuzzled" "Environment=Dev" "StudentName=${STUDENT_NAME}" "JakeTearDown=True" \
  --region "${AWS_DEFAULT_REGION}" \
  --parameter-overrides \
     VpcCidr="10.0.0.0/24" \
      PubSubnetACidr="10.0.0.0/26" \
      UserDataScript="${UserDataScript}" \
      StudentName="JAKE" \
  --debug &&
      echo "Complete!" &&
      exit 1
