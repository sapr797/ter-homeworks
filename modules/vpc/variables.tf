# Обязательные переменные
variable "network_name" {
  type        = string
  description = "Имя VPC сети"
  default     = "vpc-network"
}

variable "zone" {
  type        = string
  description = "Зона доступности для подсети"
  default     = "ru-central1-a"
}

variable "cidr" {
  type        = string
  description = "CIDR блок для подсети"
  default     = "192.168.10.0/24"
}

# Опциональные переменные
variable "description" {
  type        = string
  description = "Описание сети"
  default     = "VPC network created by Terraform"
}

variable "subnet_name" {
  type        = string
  description = "Имя подсети"
  default     = "vpc-subnet"
}

variable "subnet_description" {
  type        = string
  description = "Описание подсети"
  default     = "Subnet created by Terraform"
}

variable "labels" {
  type        = map(string)
  description = "Метки для ресурсов"
  default = {
    created_by = "terraform"
    module     = "vpc"
  }
}

variable "create_route_table" {
  type        = bool
  description = "Создавать ли таблицу маршрутизации"
  default     = false
}

variable "route_table_id" {
  type        = string
  description = "ID существующей таблицы маршрутизации"
  default     = null
}

variable "static_routes" {
  type = list(object({
    destination_prefix = string
    next_hop_address   = string
  }))
  description = "Список статических маршрутов"
  default     = []
}

variable "dhcp_options" {
  type = object({
    domain_name         = optional(string)
    domain_name_servers = optional(list(string))
    ntp_servers         = optional(list(string))
  })
  description = "DHCP опции для подсети"
  default     = null
}

# Переменные для работы с несколькими подсетями (для задания 4*)
variable "subnets" {
  type = list(object({
    name   = string
    zone   = string
    cidr   = string
    labels = optional(map(string), {})
  }))
  description = "Список подсетей для создания (для задания 4*)"
  default     = []
}

variable "env_name" {
  type        = string
  description = "Название окружения"
  default     = "development"
}
