#!/bin/sh

FOLDER=$(cd $(dirname "$0") && pwd | sed "s:/tools/bin::")

info() {
    echo "$(date "+%Y-%m-%dT%H:%M:%S") *** $1 ***"
}

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

fix_owner() {
  info "Fix ownership"
  docker run --rm -i -v $FOLDER:/src alpine:3.6 chown -R $(id -g $USER).$(id -g $USER) /src/target
}

info "Delete existing target folder"
dc target-rm

info "Run vefa-structure"
dc structure
fix_owner

info "Create ZIP file with schematrons"
mkdir -p "$FOLDER/target/site/files"
zip -r "$FOLDER/target/site/files/schematrons.zip" "$FOLDER/rules/"

info "Build and verify validation artifacts"
dc validator

info "Generate Asciidoctor documents"
dc asciidoctor
fix_owner
