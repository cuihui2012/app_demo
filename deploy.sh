#!/bin/bash

##编译+部署项目

##需要export PROJ_PATH=jenkins任务在部署机器上的路径,已在任务中的shell脚本上配置
##编译
cd $PROJ_PATH/app_demo
mvn clean install -DskipTests
##war包部署
docker cp $PROJ_PATH/app_demo/target/app_demo.war 80a011bf441a:/usr/local/tomcat/webapps
##重启docker容器
docker restart 80a011bf441a