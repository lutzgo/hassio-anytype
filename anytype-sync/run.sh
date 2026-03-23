#!/usr/bin/env bash
set -e

# Read config from HA options
EXTERNAL_IP=$(bashio::config 'external_ip')
STORAGE_PATH=$(bashio::config 'storage_path')
MEMORY_LIMIT=$(bashio::config 'memory_limit')

# Fall back to auto-detect local IP if not set
if [ -z "$EXTERNAL_IP" ]; then
    EXTERNAL_IP=$(hostname -I | awk '{print $1}')
    bashio::log.warning "No external_ip set, using auto-detected: ${EXTERNAL_IP}"
fi

bashio::log.info "Starting Anytype Sync Server"
bashio::log.info "External IP: ${EXTERNAL_IP}"
bashio::log.info "Storage path: ${STORAGE_PATH}"

mkdir -p "${STORAGE_PATH}"

# Pull and run any-sync-bundle
docker run --rm \
  -e ANY_SYNC_BUNDLE_INIT_EXTERNAL_ADDRS="${EXTERNAL_IP}" \
  -p 33010:33010 \
  -p 33020:33020/udp \
  -v "${STORAGE_PATH}:/data" \
  --memory="${MEMORY_LIMIT}" \
  ghcr.io/grishy/any-sync-bundle:latest

bashio::log.info "Anytype Sync Server stopped"
