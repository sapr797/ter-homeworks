terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.12.0"
}

provider "yandex" {
  # token     = var.token
  cloud_id                 = b1gsp6vsj607j08m27mr
  folder_id                = enp09m87v5ivgh24jpdr
  zone                     = "ru-central1-b"
  service_account_key_file = file("~C:/distr/Distr_Terr/.authorized_key.json")
}
