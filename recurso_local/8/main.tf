variable "numero" {
  type    = number
  default = 5
}

resource "local_file" "resultado" {
  filename = "archivo.txt"
  content  = "El doble de ${var.numero} es ${var.numero * 2}"
}