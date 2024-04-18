locals {
  ambientes = ["desarrollo", "produccion", "prueba"]
  proyecto  = "mi_proyecto"
}

resource "local_file" "estructura_proyecto" {
  for_each = toset(local.ambientes)
  filename = "./${local.proyecto}/${each.value}/README.md"
  content  = "Bienvenido a ${each.value} en ${local.proyecto}"
}