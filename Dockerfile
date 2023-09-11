FROM alpine:3.14

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
