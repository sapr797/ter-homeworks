resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}"
  
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8fhirjb21am2sv9aud"  # Ubuntu image
      size     = 10
    }
  }

  network_interface {
    subnet_id = "e9bproja629hr9doud9c"
    nat       = true
    security_group_ids = ["enpcf56b6oforfoso9vb"]
  }

  metadata = {
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCdTP00P9UOwjlvtpwGAYYkV60d6gNXj+BF34pBICe9scJpAKZzLCSBOa4c9QJxN7g71zCI4tdL4Q8/VH1cSYJj3asEFBl157EBwPGhCJhOB9+zETQ+nlE7q1BciaPtp78aI6/EhLCdR3c2AHzk3JqzCdbJydHunBa0tFVv5qY7qviwFEGheioN92/cIe0iFMtOCVm/pm7QK1+MVulC8+b/8+sszYhZa5eqZVKMoV4+5q9lmoSEqqaCAmljWNPghQWb8GLP0bY54zCxIwYyi783ZrneHganszpB1dqcfWWznGBUvaq7K/sUVV9njTGH5rS+QJ9iKaBefG2OaGHK2k1 iru@DESKTOP-IUA6EA7"
  }
}
