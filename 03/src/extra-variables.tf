variable "image_id" {
  type        = string
  description = "ID образа для ВМ"
  default     = "fd8fhirjb21am2sv9aud" # Ubuntu 22.04 LTS
}

variable "subnet_id" {
  type        = string
  description = "ID подсети"
  default     = "e9bproja629hr9doud9c" # terraform-subnet
}

variable "security_group_id" {
  type        = string
  description = "ID группы безопасности"
  default     = "enpcf56b6oforfoso9vb" # default security group
}

variable "ssh_public_key_path" {
  type        = string
  description = "Путь к публичному SSH ключу"
  default     = "~/.ssh/id_rsa.pub"
}
