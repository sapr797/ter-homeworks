terraform {
  required_version = ">= 1.6.0"
  
#  backend "s3" {
 #   bucket  = "terraform-state-1764129946"
  #  key     = "terraform.tfstate"
   # region  = "ru-central1"
    
   # endpoints = {
    #  s3 = "https://storage.yandexcloud.net"
   # }
    
  #  skip_region_validation      = true
   # skip_credentials_validation = true
   # skip_requesting_account_id  = true
   # skip_s3_checksum            = true
 # }
  
 required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.172.0"
   }
  }
}

provider "yandex" {
  zone      = "ru-central1-a"
#  token     = var.yc_token
 # cloud_id  = var.yc_cloud_id
  #folder_id = var.yc_folder_id
}
