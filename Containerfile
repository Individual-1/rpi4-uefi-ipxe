FROM ubuntu:22.04 AS build

# 2024/05/31
ENV IPXE_VERSION "e965f179e1654103eca33feed7a9cc4c51d91be6"

WORKDIR /build
COPY fw-vars.json /build
COPY provision-dependencies.sh /build
RUN chmod +x /build/provision-dependencies.sh
RUN apt update && apt install -y git wget parted dosfstools udev && /build/provision-dependencies.sh

COPY build-ipxe.sh /build
RUN chmod +x /build/build-ipxe.sh

CMD ["/build/build-ipxe.sh"]