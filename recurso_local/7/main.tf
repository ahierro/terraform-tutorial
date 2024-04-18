variable "datos" {
  type = map(string)
  default = {
    "name"  = "terraform"
    "owner" = "class"
  }
}

resource "local_file" "archivo_json" {
  filename = "archivo.json"
  content  = jsonencode(var.datos)
}