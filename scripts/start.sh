#!/bin/sh

# copy source
echo "Copy file"
ls
cp /data/release.tar /usr/src/app/release.tar
cd /usr/src/app

echo "uppackage"
tar -xvf release.tar --strip-components=1
rm release.tar

# install dependence
echo "install dependencies"
npm i --production --registry=https://registry.npm.taobao.org
npm i typescript -g --registry=https://registry.npm.taobao.org

# compile
echo "compile"
npm run tsc

# run
echo "start"
egg-scripts start --port=7001 --env=default

