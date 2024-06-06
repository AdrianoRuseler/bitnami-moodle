OS_ARCH="amd64"
    COMPONENTS=( \
      "php-8.0.30-13-linux-${OS_ARCH}-debian-11" \
      "apache-2.4.57-12-linux-${OS_ARCH}-debian-11" \
      "postgresql-client-13.12.0-1-linux-${OS_ARCH}-debian-11" \
      "mysql-client-11.1.2-0-linux-${OS_ARCH}-debian-11" \
      "libphp-8.0.30-4-linux-${OS_ARCH}-debian-11" \
      "render-template-1.0.6-1-linux-${OS_ARCH}-debian-11" \
      "moodle-3.11.17-0-linux-${OS_ARCH}-debian-11" \
    ) && \
    for COMPONENT in "${COMPONENTS[@]}"; do \
      if [ ! -f "${COMPONENT}.tar.gz" ]; then \
        curl -SsLf "https://downloads.bitnami.com/files/stacksmith/${COMPONENT}.tar.gz" -O ; \
        curl -SsLf "https://downloads.bitnami.com/files/stacksmith/${COMPONENT}.tar.gz.sha256" -O ; \
      fi && \
      sha256sum -c "${COMPONENT}.tar.gz.sha256"
    done
	
