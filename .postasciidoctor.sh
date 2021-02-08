#!/bin/bash

if [ -e /target/site ]; then
  mv /target/guides/* /target/site
  rm -r /target/guides
fi

find /target/site -name ".adocassets" -delete

if [ -e /target/site/shared/images/Draft.svg ]; then

  for s in /target/site/css/structure.css /target/site/styles/peppol.css; do
    cat >> $s <<EOF

.sidebarblock {
  background-color: rgba(243, 243, 242, 0.5);
}

@media only screen and (min-width: 768px) { #toctitle { font-size: 1.375em; }
  #toc.toc2 {
    background: rgba(248, 248, 247, 0.5);
  }
}

body {
  background-image: url("../shared/images/Draft.svg");
  background-attachment: fixed;
}
EOF
  done
fi

cat >> /target/site/css/structure.css <<EOF

a[href^="./transactions/"].list-group-item {
    font-style: italic;
    text-indent: 4em;
}

EOF
