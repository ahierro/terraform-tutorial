output "archivos_generados" {
  value = values(local_file.estructura_proyecto)[*].filename
}