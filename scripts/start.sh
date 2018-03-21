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
npm i egg-scripts --save

# run
echo "start"
egg-scripts start --port=7001 --env=default

