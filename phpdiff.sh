#!/usr/bin/env bash
. ~/bin/config.d/gnuhub_env
php -m > php1.txt
. ./myphp
php -m > php2.txt
diff -u php1.txt php2.txt > phpdiff.txt