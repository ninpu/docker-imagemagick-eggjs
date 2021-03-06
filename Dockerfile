FROM node:10.15.3

ENV EGG_ENV "prod"
ENV APP_PATH ""

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata
    
# install imagemagick
RUN cd /opt && \
    wget http://www.imagemagick.org/download/ImageMagick.tar.gz && \
    tar -xvf ImageMagick.tar.gz && \
    cd ImageMagick-7.0.* && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    ldconfig /usr/local/lib
    
# install eggjs-scripts
RUN mkdir -p /usr/src/app && \
    mkdir -p /usr/fonts && \
    mkdir -p /usr/output && \
    npm i egg-scripts -g

WORKDIR /usr/src/app

VOLUME /usr/fonts

VOLUME /usr/output

EXPOSE 7001

COPY scripts/start.sh /usr/start.sh

RUN chmod 777 /usr/start.sh
RUN chmod 777 /usr/output

CMD sh /usr/start.sh
