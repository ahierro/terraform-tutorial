terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

provider "local" {
  # Configuration options
}

resource "local_file" "example" {
  filename = "${var.file_name}.txt"
  content  = var.content
}

resource "local_file" "example_list" {
  for_each = toset(var.list_files)
  filename = each.value
  content  = var.content
}

resource "local_file" "example_conditional" {
  count    = var.should_create_file ? 1 : 0
  filename = "conditional_file.txt"
  content  = var.content
}