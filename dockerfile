# Use the official WordPress image
FROM wordpress:latest

# Install any additional dependencies if needed
RUN apt-get update && \
    apt-get install -y \
    less \
    vim \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Expose the default WordPress port
EXPOSE 80

# Copy custom WordPress configuration
COPY . /var/www/html/
COPY ./wp-config-sample.php /var/www/html/wp-config.php

# Define environment variables for WordPress
# ENV WORDPRESS_DB_HOST=db
# ENV WORDPRESS_DB_USER=exampleuser
# ENV WORDPRESS_DB_PASSWORD=examplepass
# ENV WORDPRESS_DB_NAME=exampledb

# Start the Apache server
CMD ["apache2-foreground"]
