#condicinales y creacion selectiva de archivos

variable "crear_archivo" {
  type    = bool
  default = true
}

resource "local_file" "mi_archivo" {
  count    = var.crear_archivo ? 1 : 0
  content  = "Este es el contenido del archivo"
  filename = "mi_archivo.txt"
}  