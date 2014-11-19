	sudo cp /vagrant/settings/httpd.conf /etc/httpd/conf/httpd.conf
	sudo cp /vagrant/settings/web.conf /etc/httpd/conf.d/web.conf
	sudo cp /vagrant/settings/php.ini /etc/php.ini
	sudo cp /vagrant/settings/my.cnf /etc/my.cnf

## アプリケーションの起動
	sudo httpd start
	sudo /etc/rc.d/init.d/mysqld start
