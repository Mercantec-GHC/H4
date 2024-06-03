# Stage 1: Build the application
FROM cirrusci/flutter:stable AS builder

# Set working directory
WORKDIR /app

# Copy the Flutter project files
COPY . .

# Install dependencies
RUN flutter pub get

# Build the application
RUN flutter build web

# Stage 2: Serve the application using nginx
FROM nginx:alpine

# Copy the build output from the builder stage
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expose the necessary port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
