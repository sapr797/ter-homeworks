locals {
  # Задание 7*: Пример VPC структуры
  vpc_example = {
    network_id = "enp7i560tb28nageq0cc"
    subnet_ids = [
      "e9bxxxxxn",
      "e2lbxxxxa",
      "b0cxxxxx6pl",
      "flxxxxxxf0h",
    ]
    subnet_zones = [
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-c",
      "ru-central1-d",
    ]
  }

  # Задание 9*: Формирование списков
  rc_list_1 = [for i in range(1, 100) : format("rc%02d", i)]
  
  rc_list_2 = [
    for i in range(1, 97) : 
    format("rc%02d", i) 
    if (i % 10 != 0 && i % 10 != 7 && i % 10 != 8 && i % 10 != 9) || i == 19
  ]
  
  # Для задания 8*: исправленный шаблон
  fixed_template = templatefile("${path.module}/templates/fixed_template.tpl", {
    webservers = [
      {
        name = "web-1"
        nat_ip_address = "192.168.1.1"
        platform_id = "standard-v3"
      }
    ]
  })
}
