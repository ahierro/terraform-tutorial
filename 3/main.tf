terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

provider "aws" {
  # The following 4 lines are required for the AWS provider to work with LocalStack
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true
}

resource "aws_s3_bucket" "demos3" {
  bucket = var.s3_bucket_name
  tags   = local.common_tags
}