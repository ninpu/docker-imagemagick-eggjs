# EggJS test环境
把eggjs的工程打包成release.tar，然后启动该镜像。
会自动解压，安装依赖。
docker run \ 
    -e EGG_ENV="prod"  \
    -e APP_PATH="xxxx" \
    -p 6666:7001