FROM stackbrew/ubuntu:12.04
MAINTAINER Lucas Carlson <lucas@rufy.com>

RUN apt-get update -qq && apt-get install -y mysql-server-5.5

ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 664 /etc/mysql/conf.d/my.cnf
ADD run.sh /run.sh
RUN chmod +x /run.sh

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD ["/run.sh"]
