# ZouZou
一个记录个人旅游的网站

### Setup
* 安装[MySQL](http://www.mysql.com/)
* 安装Python和pip
* 通过pip安装Django(Version1.8.1)，MySQL-python(Version1.2.3)
* 在MySQL命令行创建数据库 ```create database zouzou_debug default character set utf8 collate utf8_bin;```
* 在项目的根目录下执行指令 ```python manage.py makemigrations``` ```python manage.py migrate```
* 启动 ```python manage.py runserver 0.0.0.0:8888``` （端口可自行设置)
