#!/bin/sh

podman build -t=rpi4-ipxe-build .

# Required rootful podman machine configuration
MSYS_NO_PATHCONV=1 podman run -it --rm -v ./output:/build/output --privileged=true rpi4-ipxe-build
