#файлы для задания 5*
output "all_vms" {
  description = "Список всех ВМ с их параметрами"
  value = concat(
    [for vm in yandex_compute_instance.web : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }],
    [for name, vm in yandex_compute_instance.database_vm : {
      name = vm.name
      id   = vm.id
      fqdn = vm.fqdn
    }],
    [{
      name = yandex_compute_instance.storage.name
      id   = yandex_compute_instance.storage.id
      fqdn = yandex_compute_instance.storage.fqdn
    }]
  )
}

output "vpc_info" {
  value = {
    network_id   = var.vpc_name
    subnet_ids   = [var.subnet_id]
    subnet_zones = [var.default_zone]
  }
}

output "filtered_vpc" {
  value = {
    network_id   = var.vpc_name
    subnet_ids   = [for i, id in [var.subnet_id] : id if i != 2]
    subnet_zones = [for i, zone in [var.default_zone] : zone if i != 2]
  }
}
