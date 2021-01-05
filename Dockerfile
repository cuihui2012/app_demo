# war包应用tomcat容器化部署
# Author: cuihui

#alpine-linux版本,主要是小
ARG VERSION=8.0.53-jre8-alpine
FROM tomcat:${VERSION}

# 标签信息
LABEL version="base"
LABEL author="cuihui" email="751670441@qq.com" date="2020-12-31"
LABEL description="app_demo应用镜像"

# 修改镜像源,时区设置,或在run命令设置参数
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
   && apk add --no-cache tzdata \
   && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
   && echo 'Asia/Shanghai' > /etc/timezone

#安装aptcher 字体包,删除所有的缓存包
RUN set -xe \
&& apk --no-cache add ttf-dejavu fontconfig \
&& rm -rf /var/cache/apk/*.tar.gz

#tomcat主目录
ARG TOMCAT_HOME=/usr/local/tomcat

# 将jar包添加到容器中
COPY app_demo.war ${TOMCAT_HOME}/webapps