#recursos
resource "local_file" "datos" {
  content  = "Esto es una prueba"
  filename = "datos.txt"
}