#!/bin/bash
set -e
docker login -u ycstech -p ${DOCKER_PASS_YCSTECH}

cd $HOME
mkdir -p temp
cd temp

cp $HOME/sync/bolt.db .
ls -lh

cat>Dockerfile<<EOF
FROM zhangguanzhang/alpine
COPY bolt.db /
EOF
docker build -t ycstech/google_containers_db2 .
docker push ycstech/google_containers_db2
