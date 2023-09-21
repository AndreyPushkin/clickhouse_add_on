FROM yandex/clickhouse-server:latest
# Start from a base image
FROM debian:bullseye-slim

# Set environment for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get clean \
    && apt-get update -y \
    && apt-get install -y libcap2-bin \
    || cat /var/lib/apt/lists/*

# Set capabilities for ClickHouse, if it exists in /usr/bin/
RUN if [ -f "/usr/bin/clickhouse" ]; then setcap cap_sys_nice=+ep /usr/bin/clickhouse; fi


EXPOSE 8124 9000 9004

ENTRYPOINT ["clickhouse-server"]
