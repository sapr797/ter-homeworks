# Локальные переменные (Задание 5)
locals {
  # Имена ВМ с использованием интерполяции (Задание 5)
  vm_web_name = "${var.vm_web_name}-${var.vm_web_zone}"
  vm_db_name  = "${var.vm_db_name}-${var.vm_db_zone}"
  
  # Ресурсы из map-переменной (Задание 6)
  vm_web_resources = var.vms_resources.web
  vm_db_resources  = var.vms_resources.db
  
  # Общие параметры web ВМ
  vm_web_platform_id = var.vm_web_platform_id
  vm_web_zone        = var.vm_web_zone
  vm_web_preemptible = var.vm_web_preemptible
  vm_web_nat         = var.vm_web_nat
  
  # Общие параметры db ВМ
  vm_db_platform_id  = var.vm_db_platform_id
  vm_db_zone         = var.vm_db_zone
  vm_db_preemptible  = var.vm_db_preemptible
  vm_db_nat          = var.vm_db_nat
  
  # Общие метаданные (Задание 6)
  common_metadata = var.metadata
}
