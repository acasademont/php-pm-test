# repro

install composer dependencies

`composer install`

build docker image (change alpine to 3.8 for php72, 3.10 for php73)

`docker build . -t php-pm-test`

then

`docker run -p 8080:8080 php-pm-test`

and now just launch a series of ab against the container

`ab -c 1 -n 2000 http://localhost:8080/`

it will crash at around 1000 requests (no crash in php 72)
