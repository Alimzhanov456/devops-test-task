#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Использование: $0 /path/to/logs N"
  echo "Где N — количество дней"
  exit 1
fi

LOG_DIR=$1
DAYS=$2

FILES=$(find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS)

if [ -z "$FILES" ]; then
  echo "Файлы .log старше $DAYS дней не найдены."
  exit 0
fi

echo "Найдены файлы:"
echo "$FILES"

read -p "Удалить эти файлы? (y/n): " ANSWER

if [ "$ANSWER" = "y" ]; then
  echo "$FILES" | xargs rm -f
  echo "Файлы удалены."
else
  echo "Удаление отменено."
fi
