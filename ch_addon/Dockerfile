# Specify the base image
ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base:6.2.7

# Get prebuilt containers from ClickHouse
FROM clickhouse/clickhouse-server:21.8 AS clickhouse

# Build the actual add-on
FROM ${BUILD_FROM}

# Download and install s6-overlay
RUN apt-get update && \
    apt-get install -y wget && \
    wget -O /tmp/s6-overlay-amd64.tar.gz https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Get ClickHouse binaries from the official images
COPY --from=clickhouse /usr/bin/clickhouse* /usr/bin/
COPY --from=clickhouse /etc/clickhouse-server/ /etc/clickhouse-server/

# Create service directories for s6-overlay
RUN mkdir -p /etc/services.d/clickhouse

# Add a script to run ClickHouse
COPY run.sh /etc/services.d/clickhouse/run

# Make run script executable
RUN chmod +x /etc/services.d/clickhouse/run

# Expose necessary ports
EXPOSE 8124 9000

# Specify the s6 overlay as entry point
ENTRYPOINT ["/init"]
