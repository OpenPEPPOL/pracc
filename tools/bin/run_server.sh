#!/usr/bin/env bash

# exit on any failure
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

# get script dir
script_dir=$(cd $(dirname $0) && pwd)

source ${script_dir}/functions.sh

# change to project root
pushd ${script_dir}/../.. > /dev/null

(
container_id=$(docker ps -q --filter "ancestor=pracc")

if [[ -n "$container_id" ]]; then
  # stop running container
  info "stop running container ${container_id}"
  docker container stop ${container_id}
fi

# remove image
info "remove pracc images"
docker image rm -f pracc
) &

# clean target
info "clean target"
rm -rf target

# build target
info "running build.sh"
${script_dir}/build.sh

# build docker image
info "building pracc image"
docker build --tag pracc .

# run docker image detached
info "running pracc image"
docker run --rm -p 80:8000 -d pracc:latest

trap - EXIT

# go back
popd > /dev/null
