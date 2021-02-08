#!/bin/sh

if [ -e /target/site ]; then
    mv /target/guides/* /target/site
fi

find /target/site -name .adocassets -exec rm '{}' \;