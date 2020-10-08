#!/bin/bash

PORT=10101

mkdir -p    $PWD/projects \
            $PWD/.config/code-server

echo "open http://127.0.0.1:$PORT"

docker run -it \
    -p $PORT:8080 \
    -v "$PWD/.config:/home/coder/.config" \
    -v "$PWD/projects:/home/coder/project" \
    -v "$HOME/.ssh:/home/coder/.ssh" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -u "$(id -u):$(id -g)" \
    phaus/code-server:latest
