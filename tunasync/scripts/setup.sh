#!/bin/bash

PREFIX_MIRROR="/data/mirrors"
MY_MIRROR_SITE_ADDRESS="127.0.0.1"

echo "0. PREFIX_MIRROR is ${PREFIX_MIRROR}"
echo "0. MY_MIRROR_SITE_ADDRESS is ${MY_MIRROR_SITE_ADDRESS}"

echo "1. install required packages"
yum -y install libcgroup-tools rsync

echo "2. create user and group"
/usr/sbin/groupadd -r tunasync
/usr/sbin/useradd -c "Tunasync Mirrors" -g tunasync -s /sbin/nologin -r -d ${PREFIX_MIRROR} tunasync
/usr/sbin/usermod -a -G docker tunasync

echo "3. prepare tunasync tools"
if [ ! -f /tmp/tunasync-linux-amd64-bin.tar.gz ];then
    wget https://github.com/tuna/tunasync/releases/download/v0.8.0/tunasync-linux-amd64-bin.tar.gz -O /tmp/tunasync-linux-amd64-bin.tar.gz
fi
mkdir -v ${PREFIX_MIRROR}/tunasync/bin
tar -C ${PREFIX_MIRROR}/tunasync/bin -zxvf /tmp/tunasync-linux-amd64-bin.tar.gz

echo "4. copy systemd files"
rsync -avP ${PREFIX_MIRROR}/tunasync/systemd/ /usr/lib/systemd/system/ && systemctl daemon-reload

echo "5. create tunasync log directory"
mkdir -pv ${PREFIX_MIRROR}/log/tunasync/

echo "6. replace to my mirror site address"
sed -i "s/mymirrorsite/${MY_MIRROR_SITE_ADDRESS}/g" ${PREFIX_MIRROR}/web/.help/*.html

echo "7. change permission"
chown -Rv tunasync:tunasync ${PREFIX_MIRROR}