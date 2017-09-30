FROM ubuntu:17.04

RUN apt-get -y update && apt-get install -y \
   apache2 \
   cron \
   curl \
   less \
   libapache2-mod-perl2 \
   libapache2-mod-php \
   libxt-dev \
   nano \
   p7zip \
   php \
   php-curl \
   php-gd \
   php-mbstring \
   php-mcrypt \
   php-mysql \
   php-xml \
   php-xmlrpc \
   wget

RUN cp /etc/apache2/conf-available/security.conf /etc/apache2/conf-available/security_old.conf; \
   cat /etc/apache2/conf-available/security.conf | sed -e 's#ServerTokens OS#ServerTokens Prod#g' -e 's#ServerSignature On#ServerSignature Off#g' > security.conf; \
   cat /etc/apache2/apache2.conf | sed "s#Timeout 300#Timeout 30#g" > apache2.conf; \
   mv apache2.conf /etc/apache2/apache2.conf; \
   mv security.conf /etc/apache2/conf-available/security.conf

CMD ["apache2ctl", "-DFOREGROUND"]

   




