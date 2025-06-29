FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Expose the application port
EXPOSE 8080

# Copy the built JAR file into the container
COPY target/spring-boot-docker.jar spring-boot-docker.jar

# Run the application
ENTRYPOINT ["java", "-jar", "spring-boot-docker.jar"]
