terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

provider "local" {
  # Configuration options
}

resource "local_file" "ejemplo" {
  filename = "${var.archivo_name}.txt"
  content  = var.contenido
}

resource "local_file" "ejemplo_lista" {
  for_each = toset(var.archivos_listas)
  filename = each.value
  content  = var.contenido
}

resource "local_file" "ejemplo_condicional" {
  count    = var.crear_archivo ? 1 : 0
  filename = "archivo_condicional.txt"
  content  = var.contenido
}