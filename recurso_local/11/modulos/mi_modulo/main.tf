resource "local_file" "archivo_modulo" {
  filename = "./archivo_modulo.txt"
  content  = "Parametro del módulo: ${var.parametro}"
}