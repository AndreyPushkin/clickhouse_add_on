#!/usr/bin/with-contenv bash
exec s6-setuidgid clickhouse /usr/bin/clickhouse-server --config=/etc/clickhouse-server/config.xml
./clickhouse server 
./clickhouse client

