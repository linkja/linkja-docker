FROM adoptopenjdk/openjdk11:alpine
LABEL maintainer="luke.rasmussen@gmail.com"

ARG BUILD_DATE
ARG VERSION

LABEL org.opencontainers.image.title="linkja-matching"
LABEL org.opencontainers.image.description="Linkja process used to perform matching across patient identifier hashes"
LABEL org.opencontainers.image.authors="Luke Rasmussen"
LABEL org.opencontainers.image.source="https://github.com/linkja/linkja-matching"
LABEL org.opencontainers.image.url="https://linkja.github.io/"
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.build-date=$BUILD_DATE

RUN apk update && apk upgrade && \
    apk add --no-cache \
        git \
        maven \
        dos2unix && \
    mkdir /opt/linkja && \
    mkdir /data

WORKDIR /opt/linkja
RUN git clone https://github.com/linkja/linkja-matching.git
WORKDIR /opt/linkja/linkja-matching
RUN mvn clean package && \
    cp ./target/Matching-*-jar-with-dependencies.jar /opt/linkja/linkja-matching.jar
WORKDIR /opt/linkja

COPY linkja-matching.sh .
RUN dos2unix linkja-matching.sh
RUN ["chmod", "+x", "/opt/linkja/linkja-matching.sh"]

# Clean up the items we no longer need
RUN rm -rf /opt/linkja/linkja-matching/ && \
    rm -rf /opt/linkja/.m2 && \
    apk del dos2unix git maven

ENTRYPOINT [ "./linkja-matching.sh" ]
