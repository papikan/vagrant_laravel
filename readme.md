# Laravel テスト環境
## 環境
### OS
- Linux : 2.6.32-358.el6.x86_64
- CentOS : 6.6

### アプリケーション
- apache : 2.2.15
- php : 5.3.3
- mysql : 5.1.73

### PHP拡張
- mcrypt

## フォルダ構成
	{ProjectRoot}
	├── project
	│   └── laravel … インストールしたlaravelのソースを置く
	├── readme.md
	└── vagrant
	    ├── Vagrantfile
	    ├── backup
	    ├── bootstrap.sh
	    ├── settings … bootstrap.shで使用する設定ファイル等
	    └── update_setting.sh

## 導入手順
1. vagrant up
2. ソースを取得する

	composer create-project laravel/laravel {ディレクトリ名} --prefer-dist

3. {ProjectRoot}/projects/laravel にソースを置く

4. hostsファイルに以下を追記

	192.168.88.100 laravel.dev
	
5. パーミッションを変更
	chmod -R 777 /var/laravel/app/storage/
	
6. ソースのルートディレクトリで composer install
composer.json	を変更しないとエラーが出るかもしれない
"laravel/framework": "4.1.*"