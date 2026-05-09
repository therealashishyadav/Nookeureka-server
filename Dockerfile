FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY .mvn .mvn
COPY mvnw mvnw
COPY pom.xml .
RUN ./mvnw dependency:go-offline -B

COPY src src
RUN ./mvnw clean package -DskipTests

EXPOSE 8761

CMD ["java", "-jar", "target/EurekaServer-0.0.1-SNAPSHOT.jar"]