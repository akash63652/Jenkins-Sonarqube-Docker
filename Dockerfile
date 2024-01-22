# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package list and install basic packages
RUN apt update -y && \
    apt install -y \
    curl \
    wget \
    vim \
    zip \
    unzip \
    apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download the Healet template from the free-css website
ADD  https://www.free-css.com/assets/files/free-css-templates/download/page296/browny.zip /var/www/html/

# Unpack the downloaded archive
RUN unzip /var/www/html/browny.zip -d /var/www/html/

# Copy the template files to the Apache web directory
RUN cp -rvf /var/www/html/browny-v1.0/* /var/www/html/

# Remove the downloaded archive and template files
RUN rm -rf /var/www/html/browny.zip /var/www/html/browny-v1.0

# Expose the Apache web server port
EXPOSE 80

# Start the Apache web server
CMD ["apache2ctl", "-D", "FOREGROUND"]
