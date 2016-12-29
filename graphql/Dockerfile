FROM node:7.3

RUN apt-get update && \
    apt-get install -y \
        dos2unix \
        git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh

RUN git clone https://github.com/kswe-2016-17/graphql-findme-graphql-service.git /workspace && \
    chown -R node:node /workspace

WORKDIR /workspace
USER node

RUN npm install

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

EXPOSE 8080
