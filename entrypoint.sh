#! /bin/sh

set -x

if [ "$RESOLV_AS_LOCAL" ]; then
  resolvconf -a load-resolv < /etc/resolv.conf
  eval $(resolvconf -v)

  for search_domain in $SEARCH; do
    for ns in $NAMESERVERS; do
      echo "local=/$search_domain/$ns" >> /etc/dnsmasq.d/locals.conf
    done
  done
fi


exec dnsmasq -k $@
