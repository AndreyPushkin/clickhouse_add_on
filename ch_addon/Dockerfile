# Specify the base image
ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base:6.2.7

# Get prebuilt containers from ClickHouse
FROM "clickhouse/clickhouse-server:21.8" as clickhouse

# Build the actual add-on
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Get ClickHouse from official images
COPY --from=clickhouse /usr/bin/clickhouse* /usr/bin/

# Create a script that will run the ClickHouse server
RUN echo -e "#!/bin/bash\n\
clickhouse-server &\n\
# Keep the script running\n\
tail -f /dev/null" > /usr/bin/run.sh && chmod +x /usr/bin/run.sh

# Expose ports (for documentation purposes)
EXPOSE 8123 9000

# Specify the default command to run the script
CMD ["/usr/bin/run.sh"]
