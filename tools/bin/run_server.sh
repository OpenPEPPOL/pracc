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
  info "stop running container ${container_id}"
  docker container stop ${container_id} &> /dev/null
fi

info "remove pracc images"
docker image rm -f pracc &> /dev/null
) &

info "clean target"
rm -rf target

info "check schematron and create xml instances"
./gradlew check

info "running build.sh"
${script_dir}/build.sh

info "building pracc image"
docker build --tag pracc .

info "running pracc image"
docker run --rm -p 80:8000 -d pracc:latest

trap - EXIT

# go back
popd > /dev/null
