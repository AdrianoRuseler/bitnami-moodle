# https://hub.docker.com/_/php
# FROM php:apache-bookworm
# FROM php:8.2-apache-bookworm
FROM php:8.1-apache-bookworm
# FROM php:8.0-apache-bookworm

# https://github.com/moodlehq/moodle-php-apache
# So we can use it anywhere for conditional stuff. Keeping BC with old (non-buildkit, builders)
ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM:-linux/amd64}
RUN echo "Building for ${TARGETPLATFORM}"

# Install some packages that are useful within the images.
RUN apt-get update && apt-get install -y \
    git \
&& rm -rf /var/lib/apt/lists/*

# Generate all the UTF-8 locales.
ARG DEBIAN_FRONTEND=noninteractive
ADD setup/locales-gen.sh /tmp/setup/locales-gen.sh
RUN /tmp/setup/locales-gen.sh

# Setup the required extensions.
ADD setup/php-extensions.sh /tmp/setup/php-extensions.sh
RUN /tmp/setup/php-extensions.sh


COPY ./public-html/ /var/www/html/


