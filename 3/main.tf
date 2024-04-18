terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

provider "aws" {
  region = var.region
  #   secret_key = ""
  #   access_key = ""
}

resource "aws_s3_bucket" "demos3" {
  bucket = var.nombre_s3
  tags   = local.common_tags
}