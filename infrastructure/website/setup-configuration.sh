# This script will replace the placeholders in the main.tf file with the correct values

# Standard configuration
AWS_TERRAFORM_BUCKET="jomicu-terraform-state"
MODULE_SOURCE="git@github.com:jomicu/terraform-aws-website-module.git//module?ref=${ENVIRONMENT}"
SERVICE="jomicu-website"
DOMAIN="jomicu.com"
ENDPOINT="${ENVIRONMENT}.${DOMAIN}"

# main.tf to replace values
TERRAFORM_MAIN="main.tf"

sed -i "s|AWS_REGION_PLACEHOLDER|$AWS_REGION|g" "${TERRAFORM_MAIN}"
sed -i "s|AWS_TERRAFORM_BUCKET_PLACEHOLDER|$AWS_TERRAFORM_BUCKET|g" "${TERRAFORM_MAIN}"
sed -i "s|MODULE_SOURCE_PLACEHOLDER|$MODULE_SOURCE|g" "${TERRAFORM_MAIN}"
sed -i "s|SERVICE_PLACEHOLDER|$SERVICE|g" "${TERRAFORM_MAIN}"
sed -i "s|ENVIRONMENT_PLACEHOLDER|$ENVIRONMENT|g" "${TERRAFORM_MAIN}"
sed -i "s|DOMAIN_PLACEHOLDER|$DOMAIN|g" "${TERRAFORM_MAIN}"
sed -i "s|ENDPOINT_PLACEHOLDER|$ENDPOINT|g" "${TERRAFORM_MAIN}"

