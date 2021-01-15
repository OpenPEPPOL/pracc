#!/bin/bash

if [ -e /target/site ]; then
  mv /target/guides/* /target/site
  rm -r /target/guides
fi

find /target/site -name ".adocassets" -delete

if [ -e /target/site/shared/images/Draft.svg ]; then

  for s in /target/site/css/structure.css /target/site/styles/peppol.css; do
    cat >> $s <<EOF

body {
  background-image: url("../shared/images/Draft.svg");
  background-attachment: fixed;
}
EOF
  done
fi
