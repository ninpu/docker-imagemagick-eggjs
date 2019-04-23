FROM node:10.15.3

ENV EGG_ENV "prod"
ENV APP_PATH ""

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# install imagemagick
RUN apt-get update && apt-get install -y \
    imagemagick && \
    apt-get clean

# install eggjs-scripts
RUN mkdir -p /usr/src/app && \
    mkdir -p /usr/temp && \
    mkdir -p /usr/output && \
    npm i egg-scripts -g

WORKDIR /usr/src/app

VOLUME /usr/temp

VOLUME /usr/output

EXPOSE 7001

COPY scripts/start.sh /usr/start.sh

RUN chmod 777 /usr/start.sh

CMD sh /usr/start.sh
