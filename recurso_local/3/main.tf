#variables
variable "files" {
  type    = string
  default = "datos"
}

variable "texto" {
  type    = string
  default = "Esto es una prueba"
}

resource "local_file" "datos" {
  content  = "${var.texto}.txt"
  filename = var.files
}