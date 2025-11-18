# outputs.tf - выходные значения

output "web_servers_public_ips" {
  description = "Публичные IP адреса web серверов"
  value       = aws_instance.web_servers[*].public_ip
}

output "web_servers_private_ips" {
  description = "Приватные IP адреса web серверов"
  value       = aws_instance.web_servers[*].private_ip
}

output "ansible_inventory_path" {
  description = "Путь к сгенерированному inventory файлу"
  value       = local.ansible_inventory_path
}
