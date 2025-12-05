terraform {
  required_version = ">= 1.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.92.0"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

# Использование модуля VPC
module "vpc" {
  source = "./modules/vpc"

  network_name = "production-network"
  subnet_name  = "production-subnet"
  zone         = "ru-central1-a"
  cidr         = "192.168.100.0/24"

  labels = {
    environment = "production"
    project     = "homework-04"
    managed-by  = "terraform"
  }
}

# Вывод информации для проверки
output "vpc_info" {
  value = module.vpc.network_info
}

output "subnet_info" {
  value = module.vpc.subnet_info
}
