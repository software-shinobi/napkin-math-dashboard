#
# Dockerfile for the Paycheck Calculator Web Application
#
FROM httpd

MAINTAINER Troy Burney “troy@softwareshinobi.com”

USER root

ENV webServerFileRoot /usr/local/apache2/htdocs/

RUN rm -rf  $webServerFileRoot

COPY ./     $webServerFileRoot

RUN ls -lha $webServerFileRoot

# Expose ports for the web server
EXPOSE 80
