#!/bin/bash
set -eu -o pipefail

for i in {1..10}
do
  echo "#### Iteration $i ####"
  cat <<EOF > Dockerfile
FROM busybox:latest

RUN ["/bin/sh"]
EOF
  docker build --no-cache -t sillyimage:0.0.1 .
  docker rmi sillyimage:0.0.1
  docker rmi -f busybox:latest
  rm Dockerfile
done
