# Specify the base image
ARG BUILD_FROM=ubuntu:latest

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

# Specify the default command to run the script
CMD ["/usr/bin/run.sh"]
