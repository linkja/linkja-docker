FROM adoptopenjdk/openjdk11
LABEL maintainer="luke.rasmussen@gmail.com"

ARG BUILD_DATE
ARG VERSION

LABEL org.opencontainers.image.title="linkja-crypto"
LABEL org.opencontainers.image.description="Linkja crypto library used for secure hashing across projects"
LABEL org.opencontainers.image.authors="Luke Rasmussen"
LABEL org.opencontainers.image.source="https://github.com/linkja/linkja-crypto"
LABEL org.opencontainers.image.url="https://linkja.github.io/"
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.build-date=$BUILD_DATE

RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    pkg-config \
    libssl-dev \
    maven \
    dos2unix \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /opt/linkja && \
    mkdir /data

WORKDIR /opt/linkja

RUN git clone -b linux-build https://github.com/linkja/linkja-crypto.git .

COPY linkja-crypto.sh .
RUN dos2unix linkja-crypto.sh
RUN ["chmod", "+x", "/opt/linkja/linkja-crypto.sh"]

ENTRYPOINT [ "./linkja-crypto.sh" ]
