ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG APP_VERSION="latest"

RUN apk add --no-cache bash curl

# Pull the any-sync-bundle binary for the right arch
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then GOARCH="amd64"; \
    elif [ "$ARCH" = "aarch64" ]; then GOARCH="arm64"; \
    elif [ "$ARCH" = "armv7l" ]; then GOARCH="arm"; \
    else GOARCH="amd64"; fi && \
    echo "Architecture: $GOARCH"

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
