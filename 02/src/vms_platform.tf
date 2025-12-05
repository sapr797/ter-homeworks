# Переменные для web ВМ (Задание 2)
variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образа для web ВМ"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя web ВМ"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "ID платформы для web ВМ"
}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона для web ВМ"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Флаг прерываемости для web ВМ"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "NAT для web ВМ"
}

# Переменные для db ВМ (Задание 3)
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Имя db ВМ"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "ID платформы для db ВМ"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона для db ВМ"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Флаг прерываемости для db ВМ"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "NAT для db ВМ"
}

# Map-переменная для ресурсов ВМ (Задание 6)
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
  }))
  description = "Ресурсы для виртуальных машин"
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
    }
  }
}

# Map-переменная для метаданных (Задание 6)
variable "metadata" {
  type = map(string)
  description = "Общие метаданные для всех ВМ"
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:${var.vms_ssh_public_root_key}"
  }
}

# Переменная для задания 8*
variable "test" {
  type = list(map(list(string)))
  description = "SSH connection strings and IP addresses for servers"
  default = []
}
