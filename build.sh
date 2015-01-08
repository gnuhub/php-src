#!/usr/bin/env bash
./buildconf --force
./configure \
--disable-all \
--with-xsl --enable-libxml --enable-dom \
--with-curl \
--prefix=${HOME}/gnuhubdata/workspace2/php
make
make install

otool -L ${HOME}/gnuhubdata/workspace2/php/bin/php > dylib.txt