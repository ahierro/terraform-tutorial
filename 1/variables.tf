variable "file_name" {
  type    = string
  default = "archivo"
}

variable "content" {
  type    = string
  default = "Hola Mundo2"
}

variable "list_files" {
  type    = list(string)
  default = ["file1.txt", "file2.txt"]
}

variable "should_create_file" {
  type    = bool
  default = true
}