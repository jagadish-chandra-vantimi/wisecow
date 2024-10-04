# Use a lightweight Linux distribution as the base image
FROM debian:latest

# Install necessary dependencies (cowsay, fortune-mod, and netcat-openbsd)
RUN apt-get update && \
    apt-get install -y \
    cowsay \
    fortune-mod \
    netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the wisecow.sh script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the wisecow.sh script executable
RUN chmod +x /app/wisecow.sh

# Expose the port the server will run on
EXPOSE 4499

# Command to run the wisecow.sh script when the container starts
CMD ["/app/wisecow.sh"]
