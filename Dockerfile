# Use a base image
FROM nginx:latest

# Copy HTML, CSS, and JS files to the container
COPY index.html /usr/share/nginx/html
COPY style.css /usr/share/nginx/html
COPY script.js /usr/share/nginx/html

# Expose port 80 for the container
EXPOSE 80
