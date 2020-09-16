FROM ubuntu:18.04

ARG DATABASE_PASSWORD
RUN echo DATABASE_PASSWORD
RUN echo $DATABASE_PASSWORD

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

# Enable PPA repos
RUN apt-get install -y software-properties-common

# Disable these development tools in production
RUN apt-get install -y vim htop nmap wget zsh tmux rsync net-tools iotop mytop

RUN apt-get install -y vim python3-minimal python3-pip python-mysqldb libmysqlclient-dev mysql-client apt-transport-https php-common libapache2-mod-php7.2 php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-xml php7.2-zip libapache2-mod-php7.2 php-gettext php7.2-curl php7.2-gd php7.2-mysql
RUN apt-add-repository -y --update ppa:ansible/ansible

RUN mkdir -p /var/log/apache2

# Copy web applications
COPY var/www/html/annual-checklist/ /usr/lib/apache2/htdocs/annual-checklist

# Provision image with ansible-playbook
RUN apt-get install -y ansible
COPY etc/ansible/ /etc/ansible
RUN cd /etc/ansible; ansible-playbook --extra-vars "DATABASE_PASSWORD=$DATABASE_PASSWORD" httpd.yml

EXPOSE 80
ENTRYPOINT ['/usr/sbin/apachectl', '-D', 'FOREGROUND']
