cat > inventory.tf << 'EOF'
# inventory.tf - генерация Ansible inventory

# Генерация Ansible inventory файла из шаблона
data "template_file" "inventory" {
  template = file("${path.module}/templates/inventory.tpl")
  
  vars = {
    webservers = join("\n", aws_instance.web_servers[*].public_ip)
  }
}

resource "local_file" "ansible_inventory" {
  content  = data.template_file.inventory.rendered
  filename = local.ansible_inventory_path
}

# Локальная переменная для пути к inventory-файлу
locals {
  ansible_inventory_path = "${path.module}/../ansible/hosts.ini"
}
EOF
