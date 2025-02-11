FROM alpine:latest

RUN apk add --no-cache  \
    aws-cli \
    helm

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
