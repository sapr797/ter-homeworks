# Создание VPC сети
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Создание подсети
resource "yandex_vpc_subnet" "develop" {
  name           = "${var.vpc_name}-${var.default_zone}"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

# Data source для образа Ubuntu
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

# Создание виртуальной машины web
resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name
  platform_id = local.vm_web_platform_id
  zone        = local.vm_web_zone

  resources {
    cores         = local.vm_web_resources.cores
    memory        = local.vm_web_resources.memory
    core_fraction = local.vm_web_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vm_web_resources.disk_size
      type     = local.vm_web_resources.disk_type
    }
  }

  scheduling_policy {
    preemptible = local.vm_web_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = local.vm_web_nat
  }

  metadata = local.common_metadata
}

# Создание виртуальной машины db (Задание 3)
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = local.vm_db_platform_id
  zone        = local.vm_db_zone

  resources {
    cores         = local.vm_db_resources.cores
    memory        = local.vm_db_resources.memory
    core_fraction = local.vm_db_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vm_db_resources.disk_size
      type     = local.vm_db_resources.disk_type
    }
  }

  scheduling_policy {
    preemptible = local.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = local.vm_db_nat
  }

  metadata = local.common_metadata
}
