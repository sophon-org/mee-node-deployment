FROM bcnmy/mee-node:1.1.94

USER root
RUN mkdir -p /usr/src/app/chains && rm -f /usr/src/app/chains/*.json

 
COPY chains-testnet/531050204.json /usr/src/app/chains/531050204.json

 