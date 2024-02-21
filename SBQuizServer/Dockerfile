
FROM amazoncorretto:21
MAINTAINER Fegrus

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/myservice/myservice.jar"]
EXPOSE 8080

# Add the service itself
ARG JAR_FILE
ADD target/SBQuizServer-0.0.1-SNAPSHOT.jar /usr/share/myservice/myservice.jar