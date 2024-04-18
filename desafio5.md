## Desafío Terraform para Implementar un Sitio WordPress en AWS

### Descripción

El desafío consiste en utilizar Terraform para crear una infraestructura en AWS que admita un sitio web de WordPress. Se deben configurar los siguientes recursos:

- **Bucket S3:** Debe tener un nivel de acceso privado, activar el control de propiedad de objetos y habilitar el versionamiento.
- **Grupo de Seguridad:** Permitir el tráfico HTTP (puerto 80) y acceso a la base de datos MySQL (puerto 3306).
- **Instancia EC2:** Con los siguientes requisitos:
  - Utilizar una imagen AMI específica (Amazon Linux o Ubuntu).
  - Asignar un nombre proporcionado como variable.
  - Usar el tipo de instancia especificado como variable.
  - Colocar la instancia en una subred en la zona de disponibilidad "us-east-1a".
  - Asociar el grupo de seguridad creado anteriormente.
  - Configurar el user_data con los datos de instalación necesarios.
- **Instancia Bastion:** Para conectarse a la base de datos.
- **RDS MySQL:** Con las siguientes características:
  - Identificador: wordpressdb.
  - Motor: MySQL versión 8.0.
  - Clase de instancia: db.t2.micro.
  - Almacenamiento asignado: 10 GB.
  - Nombre de la base de datos: wordpressdb.
  - Usuario y contraseña específicos.
  - Utilizar el grupo de seguridad creado anteriormente.
- **VPC:** Crear una VPC o utilizar la VPC por defecto.

Recuerda que el backend de Terraform debe configurarse para almacenar el estado en un bucket S3.

### Prerrequisitos

- Instala Terraform en tu máquina local siguiendo esta [guía oficial de HashiCorp](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- Descarga e instala el editor Visual Studio Code utilizando esta [guía](https://code.visualstudio.com/download).

![](ec2-rds-tutorial-architecture.png)

### Instrucciones

Utiliza el siguiente código de Terraform como base para construir la infraestructura:

```hcl
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "xxxxxxxx"
    key    = "nombre-user/deploy.tfstate"
    region = "us-east-1"
  }
}
```

Completa el código proporcionado, preferiblemente utilizando módulos necesarios para implementar la infraestructura requerida.

Una vez completada la configuración, ejecuta `terraform init`, `terraform plan` y `terraform apply` para implementar la infraestructura en tu cuenta de AWS.