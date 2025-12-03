output "vm_external_ip" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
  description = "Внешний IP адрес ВМ"
}

output "vm_internal_ip" {
  value = yandex_compute_instance.platform.network_interface.0.ip_address
  description = "Внутренний IP адрес ВМ"
}

output "vm_name" {
  value = yandex_compute_instance.platform.name
  description = "Имя виртуальной машины"
}
