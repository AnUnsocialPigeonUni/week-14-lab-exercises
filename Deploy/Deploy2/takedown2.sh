#! /usr/bin/env bash

#Create VPC 10.0.0.0/22

if [[ -z "${STUDENT_NAME}" ]]; then
  echo "STUDENT_NAME is not set"
  echo "Please run the command \"export STUDENT_NAME={desired name}\""
  exit 1
fi

readonly STACK_NAME="${STUDENT_NAME}-networking"
readonly TEMPLATE_FILE="$(dirname "${BASH_SOURCE[0]}")/templates/teardown.json"
readonly AWS_DEFAULT_REGION="eu-west-2"

aws ec2 describe-vpcs \
	--filters Name=tag:JakeTearDown,Values=True
