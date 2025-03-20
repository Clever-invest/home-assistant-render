FROM homeassistant/home-assistant:stable

# Установка необходимых инструментов для удобства работы
RUN apk add --no-cache nano bash curl jq

# Настройка рабочего каталога
WORKDIR /config

# Копирование предварительных конфигураций
COPY config/* /config/

# Установка разрешений на файлы конфигурации
RUN chmod 755 /config

# Прокидываем необходимые порты
# 8123 - основной порт Home Assistant
EXPOSE 8123

# Том для постоянного хранения 
VOLUME /config

# Переменные среды по умолчанию
ENV TZ=Europe/Moscow

# Запуск Home Assistant
ENTRYPOINT ["hass", "--config", "/config"]
