#!/usr/bin/with-contenv bashio

export FRITZBOX_ENDPOINT_URL=$(bashio::config 'fritzbox_endpoint_url')
export FRITZBOX_ENDPOINT_TIMEOUT=$(bashio::config 'fritzbox_endpoint_timeout')
export FRITZBOX_ENDPOINT_INTERVAL=$(bashio::config 'fritzbox_endpoint_interval')
export CLOUDFLARE_API_EMAIL=$(bashio::config cloudflare_api_email)
export CLOUDFLARE_API_TOKEN=$(bashio::config cloudflare_api_key)
export CLOUDFLARE_ZONES_IPV4=$(bashio::config 'cloudflare_zones_ipv4|join(", ")')
export CLOUDFLARE_ZONES_IPV6=$(bashio::config 'cloudflare_zones_ipv6|join(", ")')
export DEVICE_LOCAL_ADDRESS_IPV6=$(bashio::config 'device_local_address_ipv6')

/app/server
