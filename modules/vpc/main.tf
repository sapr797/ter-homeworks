# Модуль VPC для создания сети и подсети в Yandex Cloud

# Создание VPC сети
resource "yandex_vpc_network" "network" {
  name        = var.network_name
  description = var.description
  labels      = var.labels
}

# Создание подсети
resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  description    = var.subnet_description
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.cidr]
  route_table_id = var.route_table_id

  dynamic "dhcp_options" {
    for_each = var.dhcp_options != null ? [var.dhcp_options] : []
    content {
      domain_name         = dhcp_options.value.domain_name
      domain_name_servers = dhcp_options.value.domain_name_servers
      ntp_servers         = dhcp_options.value.ntp_servers
    }
  }

  labels = merge(var.labels, {
    subnet = var.subnet_name
    zone   = var.zone
  })
}

# Создание таблицы маршрутизации (опционально)
resource "yandex_vpc_route_table" "route_table" {
  count       = var.create_route_table ? 1 : 0
  name        = "${var.network_name}-route-table"
  network_id  = yandex_vpc_network.network.id
  description = "Route table for ${var.network_name}"

  dynamic "static_route" {
    for_each = var.static_routes
    content {
      destination_prefix = static_route.value.destination_prefix
      next_hop_address   = static_route.value.next_hop_address
    }
  }

  labels = var.labels
}
