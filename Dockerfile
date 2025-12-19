# Use the official MEE node image
FROM bcnmy/mee-node:1.1.94

# Create expected dirs (optional but nice)
RUN mkdir -p /usr/src/app/chains /usr/src/app/logs /usr/src/app/keystore

# Copy your chain configs into the image
# (this replaces the bind-mount ./chains-testnet:/usr/src/app/chains)
COPY ./chains-testnet/ /usr/src/app/chains/

# Expose the port the app listens on
EXPOSE 3000

# The base image already has the correct CMD/ENTRYPOINT