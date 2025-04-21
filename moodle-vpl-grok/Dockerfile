# Use the official VPL Jail System image as the base
FROM jcrodriguezvpl/jail-ubuntu-full:latest

# Install OpenSSL if not already present (usually available in the base image)
RUN apt-get update && apt-get install -y openssl

# Set working directory
WORKDIR /etc/vpl

# Generate self-signed SSL certificates
RUN openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

# Ensure permissions are correct for the certificates
RUN chmod 600 key.pem cert.pem

# Expose the ports used by VPL Jail (HTTP and HTTPS)
EXPOSE 80 443

# Set environment variables (optional, can be overridden in docker-compose)
ENV VPL_JAIL_PORT=80 \
    VPL_JAIL_SECURE_PORT=443 \
    VPL_JAIL_URLPATH=/jail \
    VPL_JAIL_SSL_CERT_FILE=/etc/vpl/cert.pem \
    VPL_JAIL_SSL_KEY_FILE=/etc/vpl/key.pem

# Use the default entrypoint and command from the base image
CMD ["/usr/sbin/vpl-jail-server"]