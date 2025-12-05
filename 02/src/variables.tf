# Основные переменные облака (Задание 1)
variable "cloud_id" {
  type        = string
  description = "Cloud ID от Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "Folder ID от Yandex Cloud"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "Имя VPC сети"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона по умолчанию"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.129.0.0/24"]
  description = "CIDR блок по умолчанию"
}

# SSH переменные (Задание 1)
variable "vms_ssh_public_root_key" {
  type        = string
  description = "Публичная часть SSH-ключа для доступа к ВМ"
}
