FROM debian:bullseye-slim

# Set environment for non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required tools
RUN apt-get update -y && apt-get install -y libcap2-bin clickhouse-server

EXPOSE 8123 9000 9009 9010

CMD ["clickhouse-server"]
