php_test:
	for file in `ls *.php`; do /usr/bin/php -l $$file; done