#!/usr/bin/env bash

# exit on any failure
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# get script dir
script_dir=$(cd $(dirname $0) && pwd)

container_id=$(docker ps -q --filter "ancestor=pracc")

if [[ -n "$container_id" ]]; then
  # stop running container
  docker container stop ${container_id}
fi

# remove image
docker image rm -f pracc

# clean project
rm -rf ${script_dir}/../../target

# build target
${script_dir}/build.sh

# change to project root
pushd ${script_dir}/../..

# build docker image
docker build --tag pracc .

# run docker image detached
docker run --rm -p 80:8000 -d pracc:latest

trap - EXIT

# go back
popd
