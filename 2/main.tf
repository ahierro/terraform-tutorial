terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "prefix" {
  count   = 4
  length  = 4
  special = false
  upper   = false
  numeric = false
}

resource "local_file" "file" {
  count    = 4
  content  = "content of the file"
  filename = "${random_string.prefix[count.index].id}-data.txt"

}