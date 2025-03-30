# Use Eclipse Temurin JDK 17 as the base image
FROM eclipse-temurin:17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file to the container
COPY target/*.jar app.jar

# Expose the application port (change if needed)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
