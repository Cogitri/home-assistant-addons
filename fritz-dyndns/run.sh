#!/usr/bin/with-contenv bashio

FRITZBOX_ENDPOINT_URL=$(bashio::config 'fritzbox_endpoint_url')
FRITZBOX_ENDPOINT_TIMEOUT=$(bashio::config 'fritzbox_endpoint_timeout')
FRITZBOX_ENDPOINT_INTERVAL=$(bashio::config 'fritzbox_endpoint_interval')
CLOUDFLARE_API_EMAIL=$(bashio::config cloudflare_api_email)
CLOUDFLARE_API_KEY=$(bashio::config cloudflare_api_key)
CLOUDFLARE_ZONES_IPV4=$(bashio::config 'cloudflare_zones_ipv4|join(", ")')
CLOUDFLARE_ZONES_IPV6=$(bashio::config 'cloudflare_zones_ipv6|join(", ")')

/app/server
