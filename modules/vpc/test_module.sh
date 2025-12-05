#!/bin/bash
echo "=== Тестирование модуля VPC ==="

# Проверяем наличие необходимых файлов
required_files=("main.tf" "variables.tf" "outputs.tf" "README.md")
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file найден"
    else
        echo "✗ $file не найден"
        exit 1
    fi
done

# Проверяем синтаксис Terraform файлов
echo ""
echo "=== Проверка синтаксиса ==="
terraform fmt -check -recursive

if [ $? -eq 0 ]; then
    echo "✓ Форматирование корректное"
else
    echo "✗ Ошибки форматирования"
    terraform fmt -recursive
    echo "Форматирование исправлено"
fi

# Проверяем валидацию
echo ""
echo "=== Валидация конфигурации ==="
terraform init -backend=false
terraform validate

if [ $? -eq 0 ]; then
    echo "✓ Конфигурация валидна"
else
    echo "✗ Ошибки валидации"
    exit 1
fi

# Генерируем документацию
echo ""
echo "=== Генерация документации ==="
terraform-docs markdown table --output-file README.md .

echo ""
echo "=== Модуль VPC готов к использованию ==="
echo "Структура модуля:"
find . -type f -name "*.tf" -o -name "*.md" | sort
