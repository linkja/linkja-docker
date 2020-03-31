FROM adoptopenjdk/openjdk11
LABEL maintainer="luke.rasmussen@gmail.com"

ARG BUILD_DATE
ARG VERSION

LABEL org.opencontainers.image.title="linkja-salt-engine"
LABEL org.opencontainers.image.description="Linkja process used to generate project salt files for individual sites"
LABEL org.opencontainers.image.authors="Luke Rasmussen"
LABEL org.opencontainers.image.source="https://github.com/linkja/linkja-salt-engine"
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
RUN git clone https://github.com/linkja/linkja-salt-engine.git
WORKDIR /opt/linkja/linkja-salt-engine
RUN mvn clean package -DskipTests=true && \
    cp ./target/SaltEngine-*-jar-with-dependencies.jar /opt/linkja/linkja-salt-engine.jar
WORKDIR /opt/linkja

COPY linkja-salt-engine.sh .
RUN dos2unix linkja-salt-engine.sh
RUN ["chmod", "+x", "/opt/linkja/linkja-salt-engine.sh"]

# Clean up the items we no longer need
RUN rm -rf /opt/linkja/linkja-salt-engine/ && \
    rm -rf /opt/linkja/.m2 && \
    apt-get --purge remove -y dos2unix git maven && \
    apt autoremove -y

ENTRYPOINT [ "./linkja-salt-engine.sh" ]
