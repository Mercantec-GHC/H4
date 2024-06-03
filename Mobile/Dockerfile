# Use the official Flutter image to build the app
FROM cirrusci/flutter:stable AS build

# Set the working directory
WORKDIR /app

# Copy the pubspec files and download dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the application code
COPY . .

# Build the Flutter web application
RUN flutter build web

# Use the official Nginx image as the base image for the final stage
FROM nginx:alpine

# Copy the build output to the Nginx HTML directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
