# Start with a base image containing Java runtime
FROM openjdk:17-jdk-slim as build

# Add Maintainer Info
LABEL maintainer="hrout55@gmail.com"

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/fx-deal-analyzer-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
COPY ${JAR_FILE} fxdealanalyzer.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/fxdealanalyzer.jar"]
