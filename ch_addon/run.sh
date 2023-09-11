#!/bin/bash

# Start the ClickHouse server
clickhouse-server &

# Keep the script running
tail -f /dev/null