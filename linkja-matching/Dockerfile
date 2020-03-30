FROM adoptopenjdk/openjdk11:alpine

RUN apk update && apk upgrade
RUN apk add --no-cache git maven dos2unix

RUN mkdir /opt/linkja
WORKDIR /opt/linkja

RUN git clone https://github.com/linkja/linkja-matching.git
WORKDIR /opt/linkja/linkja-matching
RUN mvn clean package
RUN cp ./target/Matching-*-jar-with-dependencies.jar /opt/linkja/linkja-matching.jar
WORKDIR /opt/linkja
RUN rm -rf /opt/linkja/linkja-matching/
RUN rm -rf /opt/linkja/.m2

COPY linkja-matching.sh .
# Handle Windows line endings, if present.  Solution courtesy of https://willi.am/blog/2016/08/11/docker-for-windows-dealing-with-windows-line-endings/
RUN dos2unix linkja-matching.sh
RUN ["chmod", "+x", "/opt/linkja/linkja-matching.sh"]

# Clean up the packages we no longer need
RUN apk del dos2unix git maven

RUN mkdir /data

ENTRYPOINT [ "./linkja-matching.sh" ]
