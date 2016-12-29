FROM httpd

RUN apt-get update && \
    apt-get install -y \
        dos2unix && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh

WORKDIR /usr/local/apache2

RUN rm -rf htdocs && \
    mkdir -p /data && \
    ln -s /data /usr/local/apache2/htdocs

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

EXPOSE 80
