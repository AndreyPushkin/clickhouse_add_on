FROM yandex/clickhouse-server:latest

# Set environment for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update -y && apt-get install -y --verbose-versions libcap2-bin

# Check if ClickHouse binary exists and set capabilities
RUN if [ -f "/usr/bin/clickhouse" ]; then setcap 'cap_net_bind_service=+ep' /usr/bin/clickhouse; fi

EXPOSE 8123 9000 9009 9010
