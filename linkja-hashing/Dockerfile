FROM adoptopenjdk/openjdk11
LABEL maintainer="luke.rasmussen@gmail.com"

ARG BUILD_DATE
ARG VERSION

LABEL org.opencontainers.image.title="linkja-hashing"
LABEL org.opencontainers.image.description="Linkja process used to generate patient identifier hashes"
LABEL org.opencontainers.image.authors="Luke Rasmussen"
LABEL org.opencontainers.image.source="https://github.com/linkja/linkja-hashing"
LABEL org.opencontainers.image.url="https://linkja.github.io/"
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.build-date=$BUILD_DATE

RUN apt-get update && apt-get install -y \
    git \
    maven \
    dos2unix \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /opt/linkja && \
    mkdir /data

WORKDIR /opt/linkja
RUN git clone https://github.com/linkja/linkja-hashing.git
WORKDIR /opt/linkja/linkja-hashing
RUN mvn clean package -DskipTests=true && \
    cp ./target/Hashing-*-jar-with-dependencies.jar /opt/linkja/linkja-hashing.jar
WORKDIR /opt/linkja

COPY linkja-hashing.sh .
RUN dos2unix linkja-hashing.sh
RUN ["chmod", "+x", "/opt/linkja/linkja-hashing.sh"]

# Clean up the items we no longer need
RUN rm -rf /opt/linkja/linkja-hashing/ && \
    rm -rf /opt/linkja/.m2 && \
    apt-get --purge remove -y dos2unix git maven && \
    apt autoremove -y

ENTRYPOINT [ "./linkja-hashing.sh" ]
