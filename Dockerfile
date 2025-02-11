FROM alpine:latest

RUN apk add --no-cache  \
    aws-cli \
    helm


COPY --chmod=755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
