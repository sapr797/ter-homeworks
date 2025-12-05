# Файл для работы с terraform console

# Пример переменных для задания 7*
variable "test_list" {
  type    = list(string)
  default = ["first", "second", "third"]
}

variable "test_map" {
  type = map(string)
  default = {
    admin = "admin_user"
    user  = "regular_user"
    guest = "guest_user"
  }
}

variable "servers" {
  type = map(object({
    cpu    = number
    ram    = number
    disks  = list(string)
  }))
  default = {
    server1 = {
      cpu   = 4
      ram   = 8
      disks = ["disk1", "disk2"]
    }
  }
}
