#!/usr/bin/env bash
rm -f configure
./buildconf --force
./configure \
--with-xsl --enable-libxml --enable-dom \
--with-curl \
--enable-session \
--enable-calendar \
--enable-soap \
--enable-mbstring=all \
--enable-bcmath \
--enable-zip \
--enable-ctype \
--with-bz2 \
--enable-exif \
--with-gd \
--enable-intl \
--with-gettext=/usr/local/opt/gettext \
--with-icu-dir=/usr/local/opt/icu4c \
--enable-ftp \
--with-gmp \
--with-imap=/usr/local/opt/imap-uw \
--with-imap-ssl \
--with-kerberos \
--with-openssl \
--with-zlib \
--enable-sockets \
--with-tidy \
--with-xmlrpc \
--with-ldap \
--with-ldap-sasl \
--with-mcrypt=/usr/local/opt/mcrypt \
--enable-pcntl \
--with-mysql=/Volumes/data/Users/stallman/gnuhubdata/apps/sugarcrm/mysql/  \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--prefix=${HOME}/gnuhubdata/workspace2/php > configure.log 2>&1
make
make install

otool -L ${HOME}/gnuhubdata/workspace2/php/bin/php > dylib.txt
${HOME}/gnuhubdata/workspace2/php/bin/php -m > phpmodules.txt
./phpdiff.sh
