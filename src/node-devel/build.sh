#!/bin/bash
docker login -u guidcruncher -p dckr_pat_gBx2OoWvY5bDsMQXsQTqumlcv9o

cd ./node
docker buildx build . -f ./Dockerfile -t guidcruncher/typescript-base:node-latest --pull --push

cd ../bun
docker buildx build . -f ./Dockerfile -t guidcruncher/typescript-base:bun-latest --pull --push

cd ../deno
docker buildx build . -f ./Dockerfile -t guidcruncher/typescript-base:deno-latest --pull --push

# cd ./node-develop
# docker buildx build . -f ./Dockerfile -t guidcruncher/typescript-base:node-development --pull --push

cd ../canvas
docker buildx build . -f ./Dockerfile -t guidcruncher/typescript-base:node-canvas-latest --pull --push
