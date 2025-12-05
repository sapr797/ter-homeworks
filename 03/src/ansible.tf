#файлы для задания 4
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    webservers = [
      for vm in yandex_compute_instance.web : {
        name = vm.name
        ip   = vm.network_interface[0].nat_ip_address
        fqdn = vm.fqdn
      }
    ]
    
    databases = [
      for name, vm in yandex_compute_instance.database_vm : {
        name = vm.name
        ip   = vm.network_interface[0].nat_ip_address
        fqdn = vm.fqdn
      }
    ]
    
    storage = [
      {
        name = yandex_compute_instance.storage.name
        ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
        fqdn = yandex_compute_instance.storage.fqdn
      }
    ]
  })
  filename = "${path.module}/inventory.ini"
}
