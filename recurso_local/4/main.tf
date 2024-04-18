#bucles y condicionales

variable "archivos" {
  type    = list(string)
  default = ["archivo1.txt", "archivo2.txt", "archivo3.txt"]
}

variable "texto" {
  type    = string
  default = "Esto es una prueba de listas"
}

resource "local_file" "datos" {
  for_each = toset(var.archivos)
  filename = each.value
  content  = "${var.texto} ${each.value}"
}
  