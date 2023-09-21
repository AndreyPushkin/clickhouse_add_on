FROM yandex/clickhouse-server:latest

# Set environment for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Make sure the repository information is up to date
RUN apt-get clean && \
    apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends libcap2-bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Check if ClickHouse binary exists and set capabilities
RUN if [ -f "/usr/bin/clickhouse" ]; then setcap 'cap_net_bind_service=+ep' /usr/bin/clickhouse; fi

EXPOSE 8123 9000 9009 9010
