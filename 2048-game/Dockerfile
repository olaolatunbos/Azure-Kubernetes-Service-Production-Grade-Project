# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Remove default static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your game files to the Nginx HTML directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Nginx runs by default
