variable "archivo_name" {
  type    = string
  default = "archivo"
}

variable "contenido" {
  type    = string
  default = "Hola Mundo2"
}

variable "archivos_listas" {
  type    = list(string)
  default = ["archivo1.txt", "archivo2.txt"]
}

variable "crear_archivo" {
  type    = bool
  default = true
}