# Start from the ClickHouse image
FROM yandex/clickhouse-server:latest

# Set environment for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get clean \
    && apt-get update -y \
    && apt-get install -y libcap2-bin \
    || cat /var/lib/apt/lists/*

# Set capabilities for ClickHouse
RUN setcap cap_sys_nice=+ep /usr/bin/clickhouse-server

# Expose necessary ports
EXPOSE 8124 9000 9004

# Set the entrypoint to ClickHouse server
ENTRYPOINT ["clickhouse-server"]
