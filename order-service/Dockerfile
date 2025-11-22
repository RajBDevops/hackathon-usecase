# Build stage
FROM maven:3.8.5-openjdk-17 AS builder
WORKDIR /app

# Copy pom to leverage caching
COPY pom.xml .  
RUN mvn dependency:go-offline -B  

# Copy source code and build
COPY src ./src  
RUN mvn clean package -DskipTests  

# Runtime stage
FROM openjdk:17-jre-slim AS runtime
WORKDIR /app

# Copy the built jar from builder stage
COPY --from=builder /app/target/*.jar app.jar  

# Expose port (adjust if needed)
EXPOSE 8080  

# Launch the application
ENTRYPOINT ["java", "-jar", "app.jar"]

