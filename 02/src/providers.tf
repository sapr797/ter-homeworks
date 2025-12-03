terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.9.0"
}

provider "yandex" {
  token     = "y0__xCj9fTCBRjB3RMgj-6BsRQw5sLPkQiBgWSpqYxRVQaxN4FeKLPNbuDUog"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
 # service_account_key_file = file("/home/alexlinux/.authorized_key.json")  # Убедитесь, что файл существует
}
