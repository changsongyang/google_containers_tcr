#!/bin/bash
set -e


mkdir -p ${HOME}/sync

[[ -z "$USE_DOCKER_BIN" ]] && {
  cp imgsync ${HOME}/sync/
} || {
  # 出现bug的时候直接使用docker的二进制文件，而不用提交代码触发ci
  docker run --rm -tid --name tool ycstech/google_containers_db2 top
  docker cp tool:/imgsync ${HOME}/sync/
  docker kill tool
}

docker run --rm -tid --name db ycstech/google_containers_db2 top
docker cp db:/bolt.db ${HOME}/sync/

docker kill db
