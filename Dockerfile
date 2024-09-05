# Etapa de build
# Etapa de build
FROM maven:3.8.1-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install

# Etapa de execução
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/lacopet-1.0.0.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
