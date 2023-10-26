FROM python:3.9-slim@sha256:5f0192a4f58a6ce99f732fe05e3b3d00f12ae62e183886bca3ebe3d202686c7f

MAINTAINER "zhile.io <admin@zhile.io>"

VOLUME /data

WORKDIR /opt/app

ADD . .

# 设置腾讯源
RUN pip config set global.index-url http://mirrors.cloud.tencent.com/pypi/simple
RUN pip config set global.trusted-host mirrors.cloud.tencent.com

RUN pip --no-cache-dir install --upgrade pip && pip --no-cache-dir install .[api,cloud]

RUN apt-get update
RUN apt-get install curl

ENTRYPOINT ["bin/startup.sh"]
