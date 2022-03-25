# This script will replace the placeholders in the main.tf file with the correct values

# Standard configuration
AWS_TERRAFORM_BUCKET="jomicu-terraform-state"
MODULE_SOURCE="git@github.com:jomicu/terraform-aws-website-module.git//module?ref=${ENVIRONMENT}"
SERVICE="jomicu-website"
DOMAIN="jomicu.com"

# The endpoint will be dependent on the environment
# Cache will depend on the environment
if [ "${ENVIRONMENT}" = "production" ]
then
    ENDPOINT=$DOMAIN
    CACHE_TTL="1800"
else
    ENDPOINT="${ENVIRONMENT}.${DOMAIN}"
    CACHE_TTL="0"
fi

# main.tf path to replace values
TERRAFORM_MAIN="../infrastructure/website/main.tf"

sed -i "s|AWS_REGION_PLACEHOLDER|$AWS_REGION|g" "${TERRAFORM_MAIN}"
sed -i "s|AWS_TERRAFORM_BUCKET_PLACEHOLDER|$AWS_TERRAFORM_BUCKET|g" "${TERRAFORM_MAIN}"
sed -i "s|MODULE_SOURCE_PLACEHOLDER|$MODULE_SOURCE|g" "${TERRAFORM_MAIN}"
sed -i "s|SERVICE_PLACEHOLDER|$SERVICE|g" "${TERRAFORM_MAIN}"
sed -i "s|ENVIRONMENT_PLACEHOLDER|$ENVIRONMENT|g" "${TERRAFORM_MAIN}"
sed -i "s|DOMAIN_PLACEHOLDER|$DOMAIN|g" "${TERRAFORM_MAIN}"
sed -i "s|ENDPOINT_PLACEHOLDER|$ENDPOINT|g" "${TERRAFORM_MAIN}"
sed -i "s|CACHE_TTL_PLACEHOLDER|$CACHE_TTL|g" "${TERRAFORM_MAIN}"

