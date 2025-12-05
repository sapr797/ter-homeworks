# Модуль VPC для Yandex Cloud

Этот модуль Terraform создает VPC сеть и подсеть в Yandex Cloud.

## Использование

### Базовое использование

```hcl
module "vpc" {
  source = "./modules/vpc"

  network_name = "my-network"
  subnet_name  = "my-subnet"
  zone         = "ru-central1-a"
  cidr         = "192.168.10.0/24"
}
Расширенное использование
hcl
module "vpc" {
  source = "./modules/vpc"

  network_name = "production-network"
  subnet_name  = "production-subnet"
  zone         = "ru-central1-a"
  cidr         = "10.0.1.0/24"
  
  description = "Production VPC network"
  
  labels = {
    environment = "production"
    owner       = "devops-team"
    project     = "terraform-demo"
  }
  
  create_route_table = true
  static_routes = [
    {
      destination_prefix = "10.0.2.0/24"
      next_hop_address   = "192.168.10.1"
    }
  ]
}
Использование с несколькими подсетями (задание 4*)
hcl
module "vpc_prod" {
  source   = "./modules/vpc"
  env_name = "production"

  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24", name = "prod-subnet-a" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24", name = "prod-subnet-b" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24", name = "prod-subnet-c" },
  ]
}
Входные переменные
ИмяТипОписаниеПо умолчанию
network_namestringИмя VPC сети"vpc-network"
zonestringЗона доступности"ru-central1-a"
cidrstringCIDR блок подсети"192.168.10.0/24"
descriptionstringОписание сети"VPC network created by Terraform"
subnet_namestringИмя подсети"vpc-subnet"
labelsmap(string)Метки ресурсов{created_by = "terraform"}
create_route_tableboolСоздавать таблицу маршрутизацииfalse
subnetslist(object)Список подсетей для создания[]
Выходные данные
ИмяТипОписание
network_idstringID созданной сети
subnet_idstringID созданной подсети
network_infoobjectПолная информация о сети
subnet_infoobjectПолная информация о подсети
subnetsmap(object)Информация о всех подсетях
Зависимости
Провайдер Yandex Cloud должен быть настроен в корневом модуле

Примеры
Примеры использования находятся в директории examples/.
