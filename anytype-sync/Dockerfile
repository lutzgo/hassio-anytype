ARG BUILD_FROM
FROM $BUILD_FROM AS base

# Install bashio dependencies
RUN apk add --no-cache bash curl jq

# Copy the any-sync-bundle binary from the upstream image
COPY --from=ghcr.io/grishy/any-sync-bundle:latest /usr/local/bin/any-sync-bundle /usr/local/bin/any-sync-bundle

RUN chmod +x /usr/local/bin/any-sync-bundle

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
