FROM bcnmy/mee-node:1.1.94

# The base image likely uses a non-root USER, so switch to root for setup
USER root

# Create folders + make them writable by the original app user (generic: match /usr/src/app owner)
RUN set -eux; \
    mkdir -p /usr/src/app/chains /usr/src/app/logs /usr/src/app/keystore; \
    APP_UID="$(stat -c '%u' /usr/src/app)"; \
    APP_GID="$(stat -c '%g' /usr/src/app)"; \
    chown -R "${APP_UID}:${APP_GID}" /usr/src/app/chains /usr/src/app/logs /usr/src/app/keystore

# Copy chain configs into the image (no bind mounts on Railway)
RUN set -eux; \
    APP_UID="$(stat -c '%u' /usr/src/app)"; \
    APP_GID="$(stat -c '%g' /usr/src/app)"; \
    chown -R "${APP_UID}:${APP_GID}" /usr/src/app/chains
COPY chains-testnet/ /usr/src/app/chains/

# Go back to the image's default non-root user (most images use 1000; if this fails, remove this line)
USER 1000

EXPOSE 3000
