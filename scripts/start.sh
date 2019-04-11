#!/bin/sh

mkdir -p /usr/src/app
rm -rf /usr/src/*

# download bundle
echo "download from ${APP_PATH}"
wget -c "${APP_PATH}" -O /usr/src/app/release.tar
cd /usr/src/app

echo "uppackage"
tar -xvf release.tar --strip-components=1
rm release.tar

# run
echo "start"
egg-scripts start --port=7001 --env=${EGG_ENV}

