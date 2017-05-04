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
docker run --env SRCCLR_API_TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OTI0MSwiZXhwIjoxNTI0MjU1MzI1LCJhdXRob3JpdGllcyI6IkFHRU5UIiwianRpIjoiN2I1NzMxZmUtM2JkMi00ZTczLWFhMTYtNDQ1ZTNkNjZmZjljIiwiY2xpZW50X2lkIjoiIiwic2NvcGUiOltdfQ.uGydke-mt5aUwFdpgIgUNLKibfflESm9LzuNSSv5pXGrggXGDeVdd0yQPYTnIksIHTQIFVxAt941btTMR16DoJspAvg2BUdUihgXDAcBSTZRnUsRcNNRjQDJTOnJwmGAOJWsL-KmI7j4nEUXrQ03_KycWcddCWNz8fxcDVx11pI --name $d_name $d_image
