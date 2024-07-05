# Stage 1: Build stage using Maven
FROM maven:3-openjdk-17 AS mbuilder

# Copy the source code into the container
RUN mkdir /app
COPY . /app

# Set the working directory
WORKDIR /app

# Build the application using Maven
RUN mvn clean package -DskipTests=true

# Stage 2: Run stage using Tomcat
FROM tomcat:9-jre17

# Copy the built artifact from the Maven stage into Tomcat's webapps directory
COPY --from=mbuilder /app/target/my-app.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
