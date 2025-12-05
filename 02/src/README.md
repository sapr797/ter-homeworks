# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

## Выполненные задания

### ✅ Задание 1

1. **Создан сервисный аккаунт и ключ**: Настроена аутентификация в Yandex Cloud через service account.
2. **Сгенерирован SSH-ключ**: Создан и добавлен в переменную `vms_ssh_public_root_key`.
3. **Исправлены синтаксические ошибки**:
   - Исправлено имя переменной для SSH-ключа с `vms_ssh_root_key` на `vms_ssh_public_root_key`
   - Исправлен `platform_id` с "standart-v4" на "standard-v3"
   - Добавлен размер boot_disk
   - Исправлено значение core_fraction для платформы standard-v3
4. **Подключение к ВМ**: Успешно подключились по SSH и выполнили `curl ifconfig.me`.
5. **Ответ на вопрос**:

**Как в процессе обучения могут пригодиться параметры `preemptible = true` и `core_fraction = 5`?**

- `preemptible = true` - создает прерываемую ВМ, которая стоит до 5 раз дешевле обычной. Идеально для учебных сред, где непрерывная работа не требуется.
- `core_fraction = 5` - устанавливает минимальную гарантированную долю vCPU, что значительно снижает стоимость ВМ. Достаточно для выполнения учебных заданий.

**Преимущества для обучения:**
- Экономия бюджета гранта
- Можно создавать больше ВМ для экспериментов
- Безопасность - минимальные затраты при забытых ресурсах
- Достаточная производительность для обучения


**Ответы на вопросы из задания 1:**
 Обнаруженные ошибки и их исправление:
 В variables.tf:
 Неправильное имя переменной SSH-ключа (было vms_ssh_root_key, должно быть vms_ssh_public_root_key)
 Некорректное описание переменной SSH-ключа
 Невалидное значение по умолчанию для SSH-ключа
 
 В main.tf:
 Опечатка в platform_id: "standart-v4" → "standard-v3"
 Не указан размер boot_disk
 Несоответствие имени переменной SSH-ключа
 Проблема с core_fraction:
 Для standard-v3 минимальный core_fraction = 20
 Если нужно core_fraction = 5, использовать standard-v2
 Значение параметров для обучения:
 preemptible = true - экономия средств, можно экспериментировать больше
 core_fraction = 5 - снижение стоимости при достаточной производительности для обучения


### ✅ Задание 2
- Заменены все хардкод-значения на переменные с префиксом `vm_web_`
- Объявлены переменные в `variables.tf` и `vms_platform.tf`
- Проверено: `terraform plan` не показывает изменений

### ✅ Задание 3
- Создан файл `vms_platform.tf`
- Создана вторая ВМ `netology-develop-platform-db`
- Объявлены переменные с префиксом `vm_db_`
- ВМ работает в зоне "ru-central1-b"

### ✅ Задание 4
- Создан `outputs.tf` с одним output блоком
- Вывод содержит: instance_name, external_ip, fqdn для каждой ВМ
- Выполнено: `terraform output`

### ✅ Задание 5
- Создан `locals.tf` с local-блоком
- Использована интерполяция для создания имен ВМ
- Переменные в ресурсах заменены на local-переменные

### ✅ Задание 6
1. Создана map-переменная `vms_resources` с конфигурацией обеих ВМ
2. Создана map-переменная `metadata` для общих метаданных
3. Закомментированы неиспользуемые переменные
4. Проверено: `terraform plan` не показывает изменений

### ✅ Задание 7*

1. **Второй элемент списка test_list:**

   element(var.test_list, 1)

1. **Второй элемент списка test_list:**
h
   element(var.test_list, 1)
    Длина списка test_list:
    length(var.test_list)

   Значение ключа admin из map test_map:

   var.test_map["admin"]
   Interpolation-выражение:

format(
  "%s is %s for production server based on OS ubuntu-20-04 with %d vcpu, %d ram and %d virtual disks",
  "John",
  var.test_map["admin"],
  var.servers["production"].cpu,
  var.servers["production"].ram,
  length(var.servers["production"].disks)
)
### Задание 8*
Переменная test и ее тип:

variable "test" {
  type = list(map(list(string)))
  default = [
    {
      "dev1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
        "10.0.1.7",
      ]
    },
    {
      "dev2" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
        "10.0.2.29",
      ]
    },
    {
      "prod1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
        "10.0.1.30",
      ]
    },
  ]
}

Выражение для извлечения строки:

 var.test[0].dev1[0]

### Задание 9*
Настройка NAT Gateway:
Создан NAT Gateway для доступа в интернет без внешних IP
Отключены внешние IP у ВМ (nat = false)
Проверен доступ через serial console
Изменен пароль пользователя: sudo passwd ubuntu
Проверен доступ в интернет с ВМ

