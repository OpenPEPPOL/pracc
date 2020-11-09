#!/usr/bin/env bash

FOLDER=$(cd $(dirname "$0") && pwd | sed "s:/tools/bin::")

script_dir=$(cd $(dirname $0) && pwd)

source ${script_dir}/functions.sh

dc () {
    if [ $(command -v docker-compose | wc -l) = "1" ]; then
        docker-compose \
            --project-directory $FOLDER \
            -f $FOLDER/docker-compose.yml \
            -p vefa-ehf-espd \
            run --rm $@
    else
        docker run --rm -i \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v $FOLDER:/src \
            docker/compose:1.18.0 \
            --project-directory $FOLDER -f /src/docker-compose.yml -p vefa-ehf-espd run --rm $@
    fi
}

info "Run vefa-structure"
dc structure

info "Create ZIP file with schematrons"
zip -qr "$FOLDER/target/site/files/schematrons-1.zip" "$FOLDER/rules/"
mv "$FOLDER/target/site/files/schematrons-1.zip" "$FOLDER/target/site/files/schematrons.zip"

(
info "Build and verify validation artifacts"
dc validator
)&

info "Generate Asciidoctor documents"
dc asciidoctor
