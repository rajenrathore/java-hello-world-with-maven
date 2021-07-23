FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY src /app/src
COPY pom.xml /app/pom.xml
RUN mvn -f /app/pom.xml clean package

FROM openjdk:8
WORKDIR /app
COPY --from=build /app/target/jb-hello-world-maven-0.1.0.jar /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "jb-hello-world-maven-0.1.0.jar"]
