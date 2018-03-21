FROM node:8.10.0

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

VOLUME /data

EXPOSE 7001

COPY scripts/start.sh /usr/start.sh

RUN chmod 777 /usr/start.sh


CMD ["/usr/start.sh"]