terraform {
  backend "s3" {
    bucket = "__TERRAFORM_BUCKET_NAME_PLACEHOLDER__"
    key    = "__SERVICE_PLACEHOLDER__/__ENVIRONMENT_PLACEHOLDER__/__TERRAFORM_STATE_FILE_NAME__"
    region = "__AWS_REGION_PLACEHOLDER__"
    acl    = "bucket-owner-full-control"
  }
}

provider "aws" {
    region = "__AWS_REGION_PLACEHOLDER__"
}

module "configuration" {
  source           = "__MODULE_SOURCE_PLACEHOLDER__"
  deployed_service = "__SERVICE_PLACEHOLDER__"
  environment      = "__ENVIRONMENT_PLACEHOLDER__"
  domain           = "__DOMAIN_PLACEHOLDER__"
  subdomain        = "__SUBDOMAIN_PLACEHOLDER__"
  cache_ttl        = "__CACHE_TTL_PLACEHOLDER__"
}
