FROM adoptopenjdk/openjdk11

RUN apt-get update
RUN apt-get install -y git cmake build-essential pkg-config libssl-dev maven

RUN mkdir /opt/linkja
RUN mkdir /data

WORKDIR /opt/linkja

RUN git clone -b linux-build https://github.com/linkja/linkja-crypto.git .

RUN apt-get install -y dos2unix
COPY linkja-crypto.sh .
# Handle Windows line endings, if present.  Solution courtesy of https://willi.am/blog/2016/08/11/docker-for-windows-dealing-with-windows-line-endings/
RUN dos2unix linkja-crypto.sh && apt-get --purge remove -y dos2unix
RUN ["chmod", "+x", "/opt/linkja/linkja-crypto.sh"]

ENTRYPOINT [ "./linkja-crypto.sh" ]
