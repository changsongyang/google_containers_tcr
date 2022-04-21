#!/bin/bash
set -e
docker login -u changsongyang -p ${DOCKER_PASS}

cd $HOME
mkdir -p temp
cd temp

cp $HOME/sync/bolt.db .
ls -lh

cat>Dockerfile<<EOF
FROM zhangguanzhang/alpine
COPY bolt.db /
EOF
docker build -t changsongyang/google_containers_db2 .
docker push changsongyang/google_containers_db2