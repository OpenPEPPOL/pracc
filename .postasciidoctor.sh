#!/bin/bash

if [ -e /target/site ]; then
  mv /target/guides/* /target/site
  rm -r /target/guides
fi

find /target/site -name ".adocassets" -delete
