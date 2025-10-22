FROM bcnmy/mee-node:1.1.94

USER root
# ensure both locations exist and remove any baked-in placeholders
RUN mkdir -p /usr/src/app/chains /app/chains \
 && rm -f /usr/src/app/chains/*.json /app/chains/*.json

# copy exactly ONE chain config (Sophon testnet)
COPY chains-testnet/531050204.json /usr/src/app/chains/531050204.json
COPY chains-testnet/531050204.json /app/chains/531050204.json
