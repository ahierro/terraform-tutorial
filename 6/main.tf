data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "az_a" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-west-2a"
}

resource "aws_security_group" "grupo_seguridad" {
  name        = "grupo_seguridad"
  description = "Permite conexiones http"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

data "aws_key_pair" "key" {
  key_name = "463779404034"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}



module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name   = "single-instance"

  instance_type          = "t2.micro"
  key_name               = data.aws_key_pair.key.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.grupo_seguridad.id]
  subnet_id              = data.aws_subnet.az_a.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}