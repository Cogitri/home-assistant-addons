ARG BUILD_FROM

FROM golang:1.20-alpine as server_build

# Add build deps
RUN apk add --update gcc g++ git curl

WORKDIR /appbuild
RUN curl -L https://github.com/Cogitri/fritzbox-cloudflare-dyndns/archive/refs/tags/1.1.2.1.tar.gz | tar -xz --strip-components=1

RUN set -ex \
    && go version \
    && cd /appbuild \
    && CGO_ENABLED=1 GOOS=linux go build -mod=vendor -o server

# Build deployable server
FROM $BUILD_FROM

ENV FRITZBOX_ENDPOINT_URL ${FRITZBOX_ENDPOINT_URL:-http://fritz.box:49000} \
    FRITZBOX_ENDPOINT_TIMEOUT ${FRITZBOX_ENDPOINT_TIMEOUT:-30s} \
    DYNDNS_SERVER_BIND ${DYNDNS_SERVER_BIND:-:8080} \
    DYNDNS_SERVER_USERNAME ${DYNDNS_SERVER_USERNAME} \
    DYNDNS_SERVER_PASSWORD ${DYNDNS_SERVER_PASSWORD} \
    CLOUDFLARE_API_EMAIL "" \
    CLOUDFLARE_API_KEY "" \
    CLOUDFLARE_ZONES_IPV4 "" \
    CLOUDFLARE_ZONES_IPV6 "" \
    DEVICE_LOCAL_ADDRESS_IPV6 ""

WORKDIR /app

RUN set -ex \
    && apk add --update --no-cache ca-certificates tzdata \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

COPY --from=server_build /appbuild/server /app/server
COPY run.sh /app
RUN chmod a+x /app/run.sh

EXPOSE 8080

CMD ["/app/run.sh"]
