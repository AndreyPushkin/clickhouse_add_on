FROM debian:bullseye-slim

# Set environment for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required tools
RUN apt-get update -y && apt-get install -y libcap2-bin clickhouse-server

EXPOSE 8123 9000 9009 9010

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
