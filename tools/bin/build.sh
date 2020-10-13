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


info "Delete existing target folder"
dc target-rm

info "Run vefa-structure"
dc structure

info "Create ZIP file with schematrons"
find "$FOLDER/target/site/files" -ls
zipinfo "$FOLDER/target/site/files/schematrons.zip"
zip -r "$FOLDER/target/site/files/schematrons-1.zip" "$FOLDER/rules/"
mv "$FOLDER/target/site/files/schematrons-1.zip" "$FOLDER/target/site/files/schematrons.zip"

info "Build and verify validation artifacts"
dc validator

info "Generate Asciidoctor documents"
dc asciidoctor
