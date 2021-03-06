php_test:
	for file in `ls *.php`; do /usr/bin/php -l $$file; done

docker_build: php_test
	docker build -t miniquiz .

docker_build_no_cache: php_test
	docker build --no-cache -t miniquiz .

docker_run: docker_build
	docker run --rm --name MiniQuiz -p 9000:80 miniquiz