variable "nombre_s3" {
  type    = string
  default = "my-tf-test-bucket-2024v1"

}

locals {
  common_tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Owner       = "Codigo-Facilito"
  }
}

variable "region" {
  type    = string
  default = "us-west-2"

}