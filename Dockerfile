FROM node:10.15.3

ENV EGG_ENV "prod"
ENV APP_PATH ""

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN mkdir -p /usr/src/app && \
    npm i egg-scripts -g

WORKDIR /usr/src/app

EXPOSE 7001

COPY scripts/start.sh /usr/start.sh

RUN chmod 777 /usr/start.sh

CMD sh /usr/start.sh