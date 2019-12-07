# app_demo
Spring+SpringMVC+Mybatis+shiro+layui简单框架

数据文件导出：
mysqldump -u root -p appdemo > d:\db.sql (cd到MySQL的安装目录的bin目录)

数据文件导入：
1 创建appdemo空库
2 use appdemo
3 source d:\db.sql

db.sql对应为默认数据源(appdemo),数据源1(appdemo1)对应默认数据源中的一张表user_test;
