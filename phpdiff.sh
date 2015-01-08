#!/usr/bin/env bash
php -m > php1.txt
. ./myphp
php -m > php2.txt
diff php1.txt php2.txt > phpdiff.txt