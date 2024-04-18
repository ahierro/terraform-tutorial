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

resource "random_string" "prefijo" {
  count   = 4
  length  = 4
  special = false
  upper   = false
  numeric = false
}

resource "local_file" "archivo" {
  count    = 4
  content  = "lista de datos"
  filename = "${random_string.prefijo[count.index].id}-datos.txt"

}