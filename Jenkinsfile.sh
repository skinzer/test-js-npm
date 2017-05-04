#! /usr/bin/env bash
echo "testing"
set -e

d_name=test-js-scanning
d_image=$d_name
docker_cleanup() {
  docker stop         $d_name || :
  docker rm   --force $d_name || :
  docker rmi $d_image         || :
}
trap docker_cleanup EXIT

docker_cleanup

docker build -f Dockerfile-builder --no-cache -t  $d_image .
docker run --env SRCCLR_API_TOKEN=testing --name $d_name $d_image
