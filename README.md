# PEPPOL Pre-award

This repository is used for documenting the pre-award BISes

The current version is 1.0.1-RC1

## Build process

Some Web-Pages are build with asciidoctor and some are build by tools from [DFØ](https://dfo.no/) (formaly difi).

All _main.adoc_ files under guides are build by asciidoctor. This is done by a docker image called difi/asciidoctor

The [project.xml](project.xml) in the root folder is parsed by a docker image called difi/vefa-structure:0.6 from DFØ and produces the syntax mapping, rules sites, and the landing page with the profiles.

### Building the Web-Pages

To build the Web-Pages you have to install the following tools:

* Docker
* Java

#### Local machine
On a local environment you can run the script [run_server.sh](./tools/bin/run_server.sh) or [run_server.cmd](./tools/bin/run_server.cmd) depending on your operating system. This script creates a docker image build by the [Dockerfile](./Dockerfile) with an image name pracc.

#### GitHub
A GitHub-Action is triggered when pushing to github. Those actions are defined in [build.yml](./.github/workflows/build.yml). The action creates a docker image and pushes it to [beschaffungsamt/peppol-pracc-site](https://hub.docker.com/r/beschaffungsamt/peppol-pracc-site). The tag is set to the branch name.
