# Use the official Dart image as the base image
FROM dart:stable AS builder

# Create a new user and set the home directory
RUN useradd -ms /bin/bash flutteruser

# Set the working directory
WORKDIR /app

# Change ownership of the working directory to the new user
RUN chown -R flutteruser:flutteruser /app

# Switch to the new user
USER flutteruser

# Copy the application files to the container
COPY Mobile /app

# Install dependencies
RUN flutter pub get

# Build the application for the web
RUN flutter build web

# Use the official NGINX image to serve the built files
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
ENTRYPOINT ["nginx", "-g", "daemon off;"]
