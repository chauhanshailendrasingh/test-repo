# Use JRE (lighter than full JDK) for running the app
FROM eclipse-temurin:17-jre-jammy

# Set working directory
WORKDIR /app

# Create a non-root user
RUN useradd -r -u 1001 appuser

# Copy built JAR into container
COPY target/*.jar app.jar

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 8080

# Run the app with JVM memory awareness in containers
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]
