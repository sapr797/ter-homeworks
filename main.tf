cat > main.tf << 'EOF'
# main.tf - основной файл конфигурации

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Настройка провайдера AWS
provider "aws" {
  region = var.aws_region
}

# Создание security group
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
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
}

# Поиск последнего AMI для Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Создание ВМ
resource "aws_instance" "web_servers" {
  count = var.instance_count
  
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name
  
  tags = {
    Name = "web-server-${count.index + 1}"
  }
}

# Null resource для запуска Ansible
resource "null_resource" "ansible_playbook" {
  depends_on = [
    aws_instance.web_servers,
    local_file.ansible_inventory
  ]

  triggers = {
    instance_ips = join(",", aws_instance.web_servers[*].public_ip)
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${local.ansible_inventory_path}' ${path.module}/../ansible/site.yml"
  }
}
EOF
