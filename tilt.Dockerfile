FROM alpine:3.23 AS certs

RUN apk --update --no-cache add ca-certificates

FROM golang:1.26.10-alpine3.23

COPY --from=certs /etc/ssl/certs /etc/ssl/certs
COPY coredns /

EXPOSE 53 53/udp
CMD ["/coredns"]
