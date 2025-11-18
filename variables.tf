# variables.tf - объявление переменных

variable "aws_region" {
  description = "AWS регион"
  type        = string
  default     = "us-east-1"
}

variable "instance_count" {
  description = "Количество инстансов"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "Тип инстанса EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Имя SSH ключа в AWS"
  type        = string
  default     = "your-key-name"
}
