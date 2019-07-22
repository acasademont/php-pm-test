# create the production container
FROM php:7.3.2-stretch AS release
RUN docker-php-ext-install pcntl
WORKDIR /app
COPY . ./
EXPOSE 80

ENTRYPOINT ["vendor/bin/ppm", "start", "--bridge=PHPPM\\Bridges\\StaticBridge", "--host=0.0.0.0", "--port=8080", "--workers=1", "--debug=0", "--logging=0", "--max-requests=10000"]
