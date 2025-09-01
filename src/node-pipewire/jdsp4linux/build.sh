#!/bini/bash

docker buildx build --target jdsp4linux -t guidcruncher/jdsp4linux:latest -f Dockerfile-jdsp4linux . --push
