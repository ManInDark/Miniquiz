copy: php_test
	rm /Users/praktikant/.bitnami/stackman/machines/xampp/volumes/root/htdocs/website/*
	cp -r ./* /Users/praktikant/.bitnami/stackman/machines/xampp/volumes/root/htdocs/website

php_test:
	for file in `ls *.php`; do /usr/bin/php -l $$file; done
