# Anytype Sync - Home Assistant Add-on Repository

[![Add repository to HA](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Flutzgo%2Fhassio-anytype)

Self-host your Anytype sync server directly from Home Assistant.

## Installation

1. Click the badge above, or manually add this repository URL in HA:
   `https://github.com/lutzgo/hassio-anytype`
2. Install the **Anytype Sync** add-on
3. Set your `external_ip` in the add-on config
4. Start the add-on
5. Copy `/data/anytype/client-config.yml` to your Anytype devices

## Requirements

- Home Assistant OS or Supervised
- Docker support (included in HAOS)

## Credits

Built on [any-sync-bundle](https://github.com/grishy/any-sync-bundle) by @grishy.
