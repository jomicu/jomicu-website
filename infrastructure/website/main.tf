terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.5"
    }
  }

  backend "s3" {
    bucket = "AWS_TERRAFORM_BUCKET_PLACEHOLDER"
    key    = "SERVICE_PLACEHOLDER/ENVIRONMENT_PLACEHOLDER/terraform.tfstate"
    region = "AWS_REGION_PLACEHOLDER"
    acl    = "bucket-owner-full-control"
  }
}

provider "aws" {
  region     = "AWS_REGION_PLACEHOLDER"
}

module "configuration" {
  source           = "MODULE_SOURCE_PLACEHOLDER"
  aws_region       = "AWS_REGION_PLACEHOLDER"
  deployed_service = "SERVICE_PLACEHOLDER"
  environment      = "ENVIRONMENT_PLACEHOLDER"
  domain           = "DOMAIN_PLACEHOLDER"
  endpoint         = "ENDPOINT_PLACEHOLDER"
  cache_ttl        = "CACHE_TTL_PLACEHOLDER"
}
