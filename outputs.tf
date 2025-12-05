# Основные output
output "network_id" {
  description = "ID созданной VPC сети"
  value       = yandex_vpc_network.network.id
}

output "network_name" {
  description = "Имя созданной VPC сети"
  value       = yandex_vpc_network.network.name
}

output "subnet_id" {
  description = "ID созданной подсети"
  value       = yandex_vpc_subnet.subnet.id
}

output "subnet_name" {
  description = "Имя созданной подсети"
  value       = yandex_vpc_subnet.subnet.name
}

output "subnet_cidr" {
  description = "CIDR блок подсети"
  value       = yandex_vpc_subnet.subnet.v4_cidr_blocks
}

output "zone" {
  description = "Зона доступности подсети"
  value       = yandex_vpc_subnet.subnet.zone
}

# Полная информация
output "network_info" {
  description = "Полная информация о сети"
  value = {
    id          = yandex_vpc_network.network.id
    name        = yandex_vpc_network.network.name
    description = yandex_vpc_network.network.description
    labels      = yandex_vpc_network.network.labels
    created_at  = yandex_vpc_network.network.created_at
  }
}

output "subnet_info" {
  description = "Полная информация о подсети"
  value = {
    id           = yandex_vpc_subnet.subnet.id
    name         = yandex_vpc_subnet.subnet.name
    zone         = yandex_vpc_subnet.subnet.zone
    network_id   = yandex_vpc_subnet.subnet.network_id
    v4_cidr_blocks = yandex_vpc_subnet.subnet.v4_cidr_blocks
    created_at   = yandex_vpc_subnet.subnet.created_at
    labels       = yandex_vpc_subnet.subnet.labels
  }
}

output "route_table_id" {
  description = "ID таблицы маршрутизации"
  value       = var.create_route_table ? yandex_vpc_route_table.route_table[0].id : null
}

# Для задания 4* (несколько подсетей)
output "subnets" {
  description = "Информация о всех созданных подсетях"
  value = { for idx, subnet in yandex_vpc_subnet.subnets : var.subnets[idx].zone => {
    id             = subnet.id
    name           = subnet.name
    zone           = subnet.zone
    v4_cidr_blocks = subnet.v4_cidr_blocks
  } }
  sensitive = false
}

output "subnet_ids" {
  description = "ID всех подсетей сгруппированные по зонам"
  value = { for idx, subnet in yandex_vpc_subnet.subnets : var.subnets[idx].zone => subnet.id }
}
