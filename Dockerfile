FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
RUN  mvn clean package -DskipTests

FROM eclipse-temurin:21-jdk-jammy
COPY  --from=build /target/portfolio-0.0.1-SNAPSHOT.jar portfolio.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "portfolio.jar"]
