#!/usr/bin/env bash
set -x
rm -f ~/gnuhubdata/apps/sugarcrm/apache2/conf/extra/httpd-vhosts.conf
ln -sfv /Users/stallman/gnuhubdata/git/php-src/fastcgi_proxy.apache.conf /Users/stallman/gnuhubdata/apps/sugarcrm/apache2/conf/extra/httpd-vhosts.conf