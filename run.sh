#!/bin/bash

PORT=10101

echo "open http://127.0.0.1:$PORT"

docker run -it -p $PORT:8080 -v "$PWD:/home/coder/project" phaus/code-server:latest
