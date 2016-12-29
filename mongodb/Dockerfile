FROM mongo

RUN apt-get update && \
    apt-get install -y \
        dos2unix \
        git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh mongodb-init-db.sh /
RUN dos2unix /entrypoint.sh /mongodb-init-db.sh && \
    chmod +x /entrypoint.sh /mongodb-init-db.sh

RUN git clone https://github.com/kswe-2016-17/graphql-findme-mongodb.git /workspace

WORKDIR /workspace

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

EXPOSE 27017

VOLUME ["/data"]
