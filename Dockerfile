##
## Dockerfile / Simple Javascript Paychec Calculator
##

FROM httpd


MAINTAINER Software Shinobi "the.software.shinobi@gmail.com"

USER root

WORKDIR /usr/local/apache2/htdocs/

COPY . .

RUN ls -lha

