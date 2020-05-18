FROM alpine:3.9
RUN apk --no-cache add dnsmasq-dnssec openresolv
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 53 53/udp
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
