FROM centos:7
RUN yum install httpd
RUN echo "hello this is mehul" > var/www/html/index.html
EXPOSE 80
cmd systemctl start httpd
