# Базовый образ с Python 3.11
FROM python:3.11-slim

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код приложения
COPY . .

# Открываем порт 80 (будет доступен снаружи как 8000)
EXPOSE 80

# Команда запуска FastAPI-приложения через Uvicorn
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "80"]