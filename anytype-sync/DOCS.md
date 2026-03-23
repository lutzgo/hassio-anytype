# Anytype Sync - Home Assistant Add-on

Self-hosted Anytype sync server. Allows your Anytype clients (Linux, Android, etc.) to sync without using Anytype's cloud.

## Configuration

| Option | Description | Default |
|---|---|---|
| `external_ip` | Your server's IP address (LAN or Tailscale IP). Leave empty to auto-detect. | auto |
| `storage_path` | Where sync data is stored | `/data/anytype` |
| `memory_limit` | Memory cap for the sync process | `500M` |

## Setup after install

1. Start the add-on
2. Find the `client-config.yml` in your storage path (e.g. `/data/anytype/client-config.yml`)
3. Copy this file to each device
4. In Anytype app → gear icon → Self-hosted → upload the yml file

## Ports

- **33010 TCP** — Main DRPC sync protocol
- **33020 UDP** — QUIC protocol

Make sure these ports are not blocked by your firewall if connecting from outside your LAN.

## Tips

- For sync outside your home network, combine with the **Tailscale** HA add-on and use your Tailscale IP as `external_ip`
- Both Anytype apps must be **in the foreground** for local P2P sync to work on Android
