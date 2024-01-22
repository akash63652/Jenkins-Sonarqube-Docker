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
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip
WORKDIR /var/www/html/
RUN unzip browny.zip
RUN cp -rvf browny-v1.0/* .
RUN rm -rf neogym browny.zip
EXPOSE  80 22
# Command to run when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
