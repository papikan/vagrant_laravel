	cat <<-'EOT'
	#==============================
	# Laravel
	#==============================
	EOT
	
# OSの設定を日本向けにする
## システムの文字セットを変更
	sudo cp /etc/sysconfig/i18n /vagrant/backup/i18n
	sudo cp /vagrant/settings/i18n /etc/sysconfig/i18n
	source /etc/sysconfig/i18n
## 時刻を日本時間にする
	cp -p /usr/share/zoneinfo/Japan /etc/localtime

## iptables
sudo cp /vagrant/settings/iptables /etc/sysconfig/iptables
sudo /etc/init.d/iptables restart

# Applications
## Vim
### インストール
	sudo yum -y install vim

## wget
### インストール
	sudo yum -y install wget

## yum
### アップデート
#	sudo yum -y update
	
## Apache
	cat <<-'EOT'
	#==============================
	# インストール apache : 2.2.15
	#==============================
	EOT
### インストール
	sudo yum -y install httpd
### スタートアップ登録
	sudo chkconfig httpd on
### 設定
#### httpd.conf
	sudo cp /etc/httpd/conf/httpd.conf /vagrant/backup/httpd.conf
	sudo cp /vagrant/settings/httpd.conf /etc/httpd/conf/httpd.conf
#### web.conf (ディレクトリ別の設定)
	sudo cp /vagrant/settings/web.conf /etc/httpd/conf.d/web.conf

## PHP
	cat <<-'EOT'
	#==============================
	# インストール PHP : 5.3.3
	#==============================
	EOT
### インストール
	sudo yum -y install php
### 開発ツール PHPモジュールをソースからコンパイルする際に必要
	sudo yum -y install php-devel
### 設定
#### php.ini
	sudo cp /etc/php.ini /vagrant/backup/php.ini
	sudo cp /vagrant/settings/php.ini /etc/php.ini

## PECL
	cat <<-'EOT'
	#==============================
	# インストール PECL : 1.9.4
	#==============================
	EOT
### インストール
	sudo yum -y install php-pear
	
## MYSQL
	cat <<-'EOT'
	#==============================
	# インストール MYSQL : 5.1.73
	#==============================
	EOT
### インストール
	sudo yum -y install mysql mysql-server
### スタートアップ登録
	sudo chkconfig mysqld on
### 設定
#### my.conf
	sudo cp /etc/my.cnf /vagrant/backup/my.cnf
	sudo cp /vagrant/settings/my.cnf /etc/my.cnf

## PHP Modules
	cat <<-'EOT'
	#========================
	# 以下のPHPモジュールを導入します
	# mcrypt
	#========================
	EOT
	### mcrypt
	wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
	wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
	sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm
	sudo yum -y install php-mcrypt*

## composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

## アプリケーションの起動
	sudo httpd start
	sudo /etc/rc.d/init.d/mysqld start
