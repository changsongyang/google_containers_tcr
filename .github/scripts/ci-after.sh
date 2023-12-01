#!/bin/bash
set -e
docker login ccr.ccs.tencentyun.com --username=914253331 -p ${DOCKER_PASS}

cd $HOME
mkdir -p temp
cd temp

cp $HOME/sync/bolt.db .
ls -lh

cat>Dockerfile<<EOF
FROM zhangguanzhang/alpine
COPY bolt.db /
EOF
docker build -t ccr.ccs.tencentyun.com/registry.ycsit.cn/google_containers_db .
docker push ccr.ccs.tencentyun.com/registry.ycsit.cn/google_containers_db
