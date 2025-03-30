# Use Eclipse Temurin JDK 17 as the base image
FROM eclipse-temurin:17-jdk AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml mvnw ./
COPY .mvn .mvn
COPY src src

# Give execute permission for the Maven wrapper
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Use a lightweight JDK runtime for the final image
FROM eclipse-temurin:17-jre

# Set the working directory
WORKDIR /app

# Copy only the built JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the application port (default 8080)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
