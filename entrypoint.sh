#!/bin/ash

echo "::group::Initialization"
echo "::notice:: input role_arn=$INPUT_ROLE_ARN"
echo "::notice:: input eks_cluster_name=$INPUT_EKS_CLUSTER_NAME"
echo "::notice:: input eks_cluster_name=$INPUT_EKS_CLUSTER_NAME"


echo "::group::Authentication"
echo "::notice:: Assuming role ($INPUT_ROLE_ARN)"

# shellcheck disable=SC2046
# shellcheck disable=SC2183

ASSUME_ROLE_OUTPUT="$(aws sts assume-role --role-arn "$INPUT_ROLE_ARN" --role-session-name helm-github-action-session --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" --output text)"
echo "::notice:: ASSUME_ROLE_OUTPUT"

#export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
#$(\
#--role-arn "$INPUT_ROLE_ARN" \
#--role-session-name MySessionName \
#--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
#--output text))
#
#echo "::notice:: Role assumed checking caller identity"
#aws sts get-caller-identity

echo "::endgroup::"
