#Stage 1
# initialize build and set base image for first stage
FROM maven:3.9.8-eclipse-temurin-22 as stage1
# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
# set working directory
WORKDIR /opt/quiz
# copy just pom.xml
COPY pom.xml .
# go-offline using the pom.xml
RUN mvn dependency:go-offline
# copy your other files
COPY ./src ./src
# compile the source code and package it in a jar file
RUN mvn clean install -Dmaven.test.skip=true
#Stage 2
# set base image for second stage
FROM amazoncorretto:22.0.0-al2023-headless
# set deployment directory
WORKDIR /opt/quiz
# copy over the built artifact from the maven image
COPY --from=stage1 /opt/quiz/target/SBQuizServer-0.0.1-SNAPSHOT.jar /opt/quiz

CMD ["java", "-jar", "SBQuizServer-0.0.1-SNAPSHOT.jar"]