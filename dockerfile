FROM ubuntu:14.04
LABEL maintainer=" ajay1041999@gmail.com "
RUN apt-get update && apt\-get install -y \
    apache2 \ 
    zip \
    unzip \
    wget
#ADD wget https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip /var/www/html/index.html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip -O /tmp/carvilla.zip
RUN mkdir -p /var/www/html && unzip /tmp/carvilla.zip -d /var/www/html
RUN rm /tmp/carvilla.zip


WORKDIR var/www/html
RUN cp -rvf carvilla-v1.0/* .
RUN rm -rf carvilla-v1.0
#RUN unzip /tmp/carvilla.zip
#RUN cp -rvf carvilla-v1.0/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#RUN rm /tmp/carvilla.zip
EXPOSE 80
