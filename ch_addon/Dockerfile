FROM yandex/clickhouse-server:latest

RUN apt-get update && apt-get install -y libcap2-bin

RUN setcap cap_sys_nice=+ep /usr/bin/clickhouse

EXPOSE 8124 9000 9004

ENTRYPOINT ["clickhouse-server"]
