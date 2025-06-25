# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 3000 to the outside world
EXPOSE 3000

# Run the Python HTTP server on port 3000 when the container launches
CMD ["python", "-m", "http.server", "3000"]