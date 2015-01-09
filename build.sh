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


. ./myphp
pecl install xdebug
ln -sfv ${HOME}/gnuhubdata/git/php-src/gnuhub_php.ini ${HOME}/gnuhubdata/workspace2/php/lib/php.ini

function php.db2
{
	php -m | grep ibm_db2
	if [ $? -ne 0 ];then
		pushd /tmp
		rm ibm_db2-1.9.6.tgz
		if [ ! -f ibm_db2-1.9.6.tgz ];then

	            wget http://pecl.php.net/get/ibm_db2-1.9.6.tgz
	    fi
	    rm -rf ibm_db2-1.9.6/
	    if [ ! -d ibm_db2-1.9.6 ];then
	            tar xfz ibm_db2-1.9.6.tgz
	    fi
	    cd ibm_db2-1.9.6
	    phpize
	    ./configure --with-IBM_DB2=/opt/IBM/db2/V10.1
	    #/home/db2inst1/sqllib/include
	    make
	    make install
	    #make test
	    popd
	fi
	
}

php.db2
php -m | grep mongo
if [ $? -ne 0 ];then
pecl install mongo
fi

otool -L ${HOME}/gnuhubdata/workspace2/php/bin/php > dylib.txt
${HOME}/gnuhubdata/workspace2/php/bin/php -m > phpmodules.txt
./phpdiff.sh
