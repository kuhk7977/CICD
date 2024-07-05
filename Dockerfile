FROM openjdk:17-jre-slim

WORKDIR /app

COPY target/my-app.jar my-app.jar

CMD ["java", "-jar", "my-app.jar"]
