#/bin/bash

IMAGE="codealley/review:reviewboard"
BUILD_CMD="sudo docker build -rm=true -t=$IMAGE ."
echo "Building Docker image: '$IMAGE'"
$BUILD_CMD
