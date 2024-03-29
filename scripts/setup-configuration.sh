# This script will replace the placeholders with the correct values

# Placeholders defined in main.tf
AWS_REGION_PLACEHOLDER="__AWS_REGION_PLACEHOLDER__"
TERRAFORM_STATE_FILE_NAME_PLACEHOLDER="__TERRAFORM_STATE_FILE_NAME_PLACEHOLDER__"
TERRAFORM_BUCKET_NAME_PLACEHOLDER="__TERRAFORM_BUCKET_NAME_PLACEHOLDER__"
SERVICE_PLACEHOLDER="__SERVICE_PLACEHOLDER__"
MODULE_SOURCE_PLACEHOLDER="__MODULE_SOURCE_PLACEHOLDER__"
ENVIRONMENT_PLACEHOLDER="__ENVIRONMENT_PLACEHOLDER__"
DOMAIN_PLACEHOLDER="__DOMAIN_PLACEHOLDER__"
SUBDOMAIN_PLACEHOLDER="__SUBDOMAIN_PLACEHOLDER__"
CACHE_TTL_PLACEHOLDER="__CACHE_TTL_PLACEHOLDER__"

# Standard configuration
TERRAFORM_STATE_FILE_NAME="terraform.tfstate"
TERRAFORM_BUCKET_NAME="jomicu-terraform-state"
SERVICE="jomicu-website"
MODULE_SOURCE="git@github.com:AWS-Infrastructure-Modules/terraform-static-website.git//module"

# Website domain
DOMAIN="jomicu.com"

# The endpoint and cache will be dependent on the environment
if [ "${ENVIRONMENT}" = "production" ]
then
    SUBDOMAIN="www"
    CACHE_TTL="0" # "1800"
else
    SUBDOMAIN="${ENVIRONMENT}"
    CACHE_TTL="0"
fi

# Path to main.tf
PATH_TO_INFRASTRUCTURE="../infrastructure/website"
FILE_WITH_PLACEHOLDERS="main.tf"
PATH_TO_PLACEHOLDERS="${PATH_TO_INFRASTRUCTURE}/${FILE_WITH_PLACEHOLDERS}"

# Replace placeholders with actual values
sed -i "s|${AWS_REGION_PLACEHOLDER}|${AWS_REGION}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${TERRAFORM_STATE_FILE_NAME_PLACEHOLDER}|${TERRAFORM_STATE_FILE_NAME}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${TERRAFORM_BUCKET_NAME_PLACEHOLDER}|${TERRAFORM_BUCKET_NAME}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${SERVICE_PLACEHOLDER}|${SERVICE}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${MODULE_SOURCE_PLACEHOLDER}|${MODULE_SOURCE}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${ENVIRONMENT_PLACEHOLDER}|${ENVIRONMENT}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${DOMAIN_PLACEHOLDER}|${DOMAIN}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${SUBDOMAIN_PLACEHOLDER}|${SUBDOMAIN}|g" "${PATH_TO_PLACEHOLDERS}"
sed -i "s|${CACHE_TTL_PLACEHOLDER}|${CACHE_TTL}|g" "${PATH_TO_PLACEHOLDERS}"

