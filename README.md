# Тестовое задание DevOps-инженер

В репозитории находится выполненное тестовое задание на позицию DevOps-инженера.

## A1. Docker

Сборка Docker-образа:
```bash
docker build -t my-web-app:latest .
```

Запуск контейнера:
```bash
docker run -d -p 8080:80 my-web-app:latest
```

После запуска приложение доступно по адресу:
http://localhost:8080

Запуск через Docker Compose:
```bash
docker compose up -d
```

Ответ на дополнительный вопрос:  
Файл `index.html` можно передавать в контейнер без пересборки образа с помощью volume (bind mount), что удобно при разработке:
```bash
docker run -d -p 8080:80 \
  -v $(pwd)/index.html:/usr/share/nginx/html/index.html \
  nginx:alpine
```

## B1. Bash

Скрипт `clean_old_logs.sh`:
- принимает путь к директории и количество дней
- ищет файлы с расширением `.log`, которые старше указанного количества дней
- выводит найденные файлы и запрашивает подтверждение перед удалением

Пример запуска:
```bash
./clean_old_logs.sh /var/log 7
```

## B2. Git

Сохранение незакоммиченных изменений и переключение ветки:
```bash
git stash
git checkout main
```

Возврат к работе:
```bash
git checkout feature/junior-task
git stash pop
```

Переименование последнего коммита:
```bash
git commit --amend -m "Новый текст коммита"
```

## B3. CI/CD

Процесс при пуше кода в ветку `main`:
1. Разработчик выполняет push в ветку `main`
2. CI/CD пайплайн запускается автоматически
3. Выполняется запуск тестов
4. Собирается Docker-образ
5. Docker-образ публикуется в Docker Hub
6. Отправляется уведомление в Telegram об успешной сборке или ошибке

## Структура проекта

```
.
├── Dockerfile
├── docker-compose.yml
├── index.html
├── clean_old_logs.sh
├── README.md
└── docs
    └── ci-cd.md
```

