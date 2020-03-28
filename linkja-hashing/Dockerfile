FROM adoptopenjdk/openjdk11

RUN apt-get update
RUN apt-get install -y git cmake build-essential pkg-config libssl-dev maven

RUN mkdir /opt/linkja
WORKDIR /opt/linkja

RUN git clone https://github.com/linkja/linkja-hashing.git
WORKDIR /opt/linkja/linkja-hashing
RUN mvn clean package -DskipTests=true
RUN cp ./target/Hashing-*-jar-with-dependencies.jar /opt/linkja/linkja-hashing.jar
WORKDIR /opt/linkja
RUN rm -rf WORKDIR /opt/linkja/linkja-hashing/

RUN apt-get install -y dos2unix
COPY linkja-hashing.sh .
# Handle Windows line endings, if present.  Solution courtesy of https://willi.am/blog/2016/08/11/docker-for-windows-dealing-with-windows-line-endings/
RUN dos2unix linkja-hashing.sh && apt-get --purge remove -y dos2unix
RUN ["chmod", "+x", "/opt/linkja/linkja-hashing.sh"]

RUN mkdir /data

ENTRYPOINT [ "./linkja-hashing.sh" ]
