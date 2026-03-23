#!/usr/bin/env bashio

EXTERNAL_IP=$(bashio::config 'external_ip')
STORAGE_PATH="/data/anytype"

if [ -z "$EXTERNAL_IP" ]; then
    EXTERNAL_IP=$(hostname -I | awk '{print $1}')
    bashio::log.warning "No external_ip set, auto-detected: ${EXTERNAL_IP}"
fi

mkdir -p "${STORAGE_PATH}"

bashio::log.info "Starting Anytype Sync Server"
bashio::log.info "External IP: ${EXTERNAL_IP}"
bashio::log.info "Storage: ${STORAGE_PATH}"

export ANY_SYNC_BUNDLE_INIT_EXTERNAL_ADDRS="${EXTERNAL_IP}"
export ANY_SYNC_BUNDLE_INIT_STORAGE="${STORAGE_PATH}"

exec /usr/local/bin/any-sync-bundle
