provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"
  #adicionales para localstack
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

resource "aws_s3_bucket" "primer_bucket" {
  bucket = "${var.nombre}-${var.env}"
  tags = {
    Name        = "demo"
    Environment = "dev"
    Owner       = "Terraform"
  }
}