terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

provider "local" {
  # Configuration options
}
###bloques
resource "local_file" "datos" {
  content  = "Esto es una prueba"
  filename = "datos.txt"
}

#terraform init
#terraform plan
#terraform apply --> yes ...  terraform apply -auto-approve 
#terraform destroy -> yes    terraform destroy -auto-approve 