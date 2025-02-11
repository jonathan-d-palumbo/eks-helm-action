#!/bin/ash

echo "::debug::role_arn=$INPUT_ROLE_ARN"



# shellcheck disable=SC2046
# shellcheck disable=SC2183
export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn "$1" \
--role-session-name MySessionName \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))

aws sts get-caller-identity
