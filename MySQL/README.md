# MySQL

## 安装

- [官网](http://www.mysql.com)

- [安装教程](http://jingyan.baidu.com/article/597035521d5de28fc00740e6.html)

- [其他说明](http://bobshute.iteye.com/blog/520760)

## 教程

- [菜鸟教程](http://www.runoob.com/mysql/mysql-tutorial.html)

### 管理/链接

```
进入/启动：mysql -u root -p

退出：mysql> exit;
```

### 数据库

```
创建：mysqladmin -u root -p create RUNOOB

删除：mysqladmin -u root -p drop RUNOOB

选择：mysql -u root -p

      mysql> use RUNOOB;
```

### 数据类型

MySQL主要有三种数据类型：数值，日期和时间，以及字符串

### 数据表

```
创建：create table runoob_tb(
   	id int not null auto_increment,
   	title varchar(100) not null,
   	author varchar(40) not null,
   	date date,
   	primary key (id)
	);

删除：drop table runoob_tb;

```

### 插入

```
插入：insert into runoob_tb
      (title,author,date)
      values
      ("PHP","John Poul",NOW());

      nsert into runoob_tb
      (title,author,date)
      values
      ("MySQL","Abdul S",NOW());

      nsert into runoob_tb
      (title,author,date)
      values
      ("JAVA","Sanjay","2007-05-06");
```

### 查询

```
查询：select id from runoob_tb;
      select * from runoob_tb;
      select * from runoob_tb where id>1 and date!="2007-05-06"; 
```

## 其他

- [java](http://blog.sina.com.cn/s/blog_4d8648910102vagq.html)

- [python](http://www.runoob.com/python/python-mysql.html)

- [excel](http://blog.sina.com.cn/s/blog_731d4f750102uxpw.html)