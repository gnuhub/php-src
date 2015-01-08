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
--prefix=${HOME}/gnuhubdata/workspace2/php > configure.log 2>&1
make
make install

otool -L ${HOME}/gnuhubdata/workspace2/php/bin/php > dylib.txt
${HOME}/gnuhubdata/workspace2/php/bin/php -m > phpmodules.txt