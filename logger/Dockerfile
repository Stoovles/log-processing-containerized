FROM alpine:3.12
RUN apk add --no-cache bc
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "100", "5000" ]
