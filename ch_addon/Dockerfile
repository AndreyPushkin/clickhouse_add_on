FROM yandex/clickhouse-server:latest

RUN setcap cap_sys_nice=+ep /usr/bin/clickhouse

EXPOSE 8124 9000 9004

ENTRYPOINT ["clickhouse-server"]
