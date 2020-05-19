#!/bin/bash

PORT=10101

mkdir -p $PWD/.config/code-server

echo "open http://127.0.0.1:$PORT"

docker run -it \
    -p $PORT:8080 \
    -v "$PWD/.config:/home/coder/.config" \
    -v "$PWD:/home/coder/project" \
    -u "$(id -u):$(id -g)" \
    phaus/code-server:latest
