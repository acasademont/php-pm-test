# create the production container
FROM alpine:3.10 AS release
RUN apk --no-cache add \
    php7 php7-cgi php7-pcntl php7-mbstring php7-iconv php7-session php7-json
WORKDIR /app
COPY . ./
EXPOSE 80

ENTRYPOINT ["vendor/bin/ppm", "start", "--bridge=PHPPM\\Bridges\\StaticBridge", "--host=0.0.0.0", "--port=8080", "--workers=1", "--debug=0", "--logging=0", "--max-requests=10000"]
