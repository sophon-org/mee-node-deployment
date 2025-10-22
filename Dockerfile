FROM bcnmy/mee-node:1.1.94
USER root
RUN mkdir -p /app/chains && rm -f /app/chains/*.json
COPY chains-testnet/531050204.json /app/chains/531050204.json