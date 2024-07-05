# Dockerfile
FROM maven:3-openjdk-17

WORKDIR /app

# Copying pom.xml file
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -B

# Copying source files
COPY src ./src

# Build application
RUN mvn package -DskipTests=true

CMD ["java", "-jar", "target/my-app.jar"]
