#!/usr/bin/env bash
./buildconf --force
./configure \
--disable-all \
--with-xsl --enable-libxml --enable-dom \
--with-curl \
--enable-session \
--enable-calendar \
--enable-soap \
--enable-mbstring=all \
--prefix=${HOME}/gnuhubdata/workspace2/php
make
make install

otool -L ${HOME}/gnuhubdata/workspace2/php/bin/php > dylib.txt
${HOME}/gnuhubdata/workspace2/php/bin/php -m > phpmodules.txt