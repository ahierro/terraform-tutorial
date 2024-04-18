resource "local_file" "proyecto" {
  filename = "${var.nombre_proyecto}/README.md"
  content  = "Directorio ppal de ${var.nombre_proyecto}"
}

resource "local_file" "assets" {
  filename = "${var.nombre_proyecto}/assets/css/main.css"
  content  = "body {color: #0000;}"
}

resource "local_file" "js" {
  filename = "${var.nombre_proyecto}/assets/js/main.js"
  content  = "Directorio ppal de ${var.nombre_proyecto}"
}

resource "local_file" "page_index_html" {
  filename = "${var.nombre_proyecto}/pages/index.html"
  content  = "<h1>Bienvenido</h1>"
}

resource "local_file" "page_about_html" {
  filename = "${var.nombre_proyecto}/pages/about.html"
  content  = "<h1>Acerca de</h1>"
}
