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

# Change to the Mobile directory
WORKDIR /app

# Build the application
RUN flutter build

# Use a minimal image for the final stage
FROM scratch AS final
WORKDIR /app
COPY --from=builder /app/build /app

# Run the application
ENTRYPOINT ["/app/your_flutter_executable"]
