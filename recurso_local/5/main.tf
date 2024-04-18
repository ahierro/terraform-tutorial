#data
#obtener la hora actual

resource "local_file" "hora_actual" {
  content  = formatdate("2024-01-02 15:04:05", timestamp())
  filename = "fecha.txt"
}

data "local_file" "hora_actual" {
  filename = local_file.hora_actual.filename
}

resource "local_file" "info" {
  content  = "Hora actual: ${data.local_file.hora_actual.content}"
  filename = "info.txt"
}

  