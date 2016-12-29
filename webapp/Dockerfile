FROM node:7.3

RUN apt-get update && \
    apt-get install -y \
        dos2unix \
        git && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
RUN dos2unix /entrypoint.sh && \
    chmod +x /entrypoint.sh

RUN mkdir -p /data

RUN git clone https://github.com/kswe-2016-17/graphql-findme-webapp.git /workspace

WORKDIR /workspace

RUN echo ' \
var connSettings = { \
    url: "http://localhost:8888/graphql", \
}; \
exports.default = connSettings; \
module.exports = exports.default; \
' >>src/conn-settings.js

RUN npm install && \
    npm run build

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

VOLUME ["/data"]
