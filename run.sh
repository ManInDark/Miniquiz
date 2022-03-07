# for php it's necessary to use some specialized code, since it changes its name with every new version
phpname=`ls /etc/init.d/ | grep php`
service $phpname start
service mysql start
service nginx start
ln /var/run/php/$phpname.sock php.sock
mysql -e "CREATE USER 'testuser'@'%' IDENTIFIED WITH mysql_native_password BY 'testuser';"
mysql -e "CREATE DATABASE quizduell"
mysql quizduell < quizduell.sql
mysql -e "GRANT ALL ON quizduell.* TO 'testuser'@'%';"
echo "Startup complete"
tail -f /var/log/nginx/access.log
