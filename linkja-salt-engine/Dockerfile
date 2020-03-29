FROM adoptopenjdk/openjdk11

RUN apt-get update
RUN apt-get install -y git cmake build-essential pkg-config libssl-dev maven

RUN mkdir /opt/linkja
WORKDIR /opt/linkja

RUN git clone https://github.com/linkja/linkja-salt-engine.git
WORKDIR /opt/linkja/linkja-salt-engine
RUN mvn clean package -DskipTests=true
RUN cp ./target/SaltEngine-*-jar-with-dependencies.jar /opt/linkja/linkja-salt-engine.jar
WORKDIR /opt/linkja
RUN rm -rf WORKDIR /opt/linkja/linkja-salt-engine/

RUN apt-get install -y dos2unix
COPY linkja-salt-engine.sh .
# Handle Windows line endings, if present.  Solution courtesy of https://willi.am/blog/2016/08/11/docker-for-windows-dealing-with-windows-line-endings/
RUN dos2unix linkja-salt-engine.sh && apt-get --purge remove -y dos2unix
RUN ["chmod", "+x", "/opt/linkja/linkja-salt-engine.sh"]

RUN mkdir /data

ENTRYPOINT [ "./linkja-salt-engine.sh" ]
