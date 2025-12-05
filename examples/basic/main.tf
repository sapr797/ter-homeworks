provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

module "vpc" {
  source = "../../"

  network_name = "example-network"
  subnet_name  = "example-subnet"
  zone         = "ru-central1-a"
  cidr         = "10.0.1.0/24"

  labels = {
    environment = "test"
    managed-by  = "terraform"
  }
}

output "vpc_info" {
  value = module.vpc.network_info
}

output "subnet_info" {
  value = module.vpc.subnet_info
}
