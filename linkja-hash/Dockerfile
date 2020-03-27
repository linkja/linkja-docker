FROM adoptopenjdk/openjdk11

RUN apt-get update
RUN apt-get install -y git cmake build-essential pkg-config libssl-dev maven

RUN mkdir /opt/linkja

WORKDIR /opt/linkja
COPY linkja-hash.sh .
RUN ["chmod", "+x", "/opt/linkja/linkja-hash.sh"]

RUN git clone -b linux-build https://github.com/linkja/linkja-crypto.git
WORKDIR /opt/linkja/linkja-crypto
RUN cmake . -DCMAKE_BUILD_TYPE=Release
RUN make clean
RUN make

WORKDIR /opt/linkja
RUN git clone https://github.com/linkja/linkja-hashing.git
WORKDIR /opt/linkja/linkja-hashing
RUN cp /opt/linkja/linkja-crypto/target/liblinkjacrypto.so lib/
RUN mvn clean package -DskipTests=true

WORKDIR /opt/linkja/
RUN cp /opt/linkja/linkja-hashing/target/Hashing-*-jar-with-dependencies.jar linkja-hashing.jar
RUN cp /opt/linkja/linkja-crypto/target/liblinkjacrypto.so liblinkjacrypto.so

RUN mkdir /data

ENTRYPOINT [ "./linkja-hash.sh" ]
