variable "tipo_instancia" {
  type    = string
  default = "t2.micro"

}

locals {
  common_tags = {
    Name        = "server-demo"
    Environment = "Dev"
    Owner       = "Codigo-Facilito"
  }
}

variable "region" {
  type    = string
  default = "us-west-2"
}