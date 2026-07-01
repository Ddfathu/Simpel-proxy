FROM alpine:latest
RUN apk add --no-cache tinyproxy
# Setup tinyproxy agar mengizinkan akses dari mana saja
RUN sed -i 's/Allow 127.0.0.1/Allow 0.0.0.0/g' /etc/tinyproxy/tinyproxy.conf
EXPOSE 8888
CMD ["tinyproxy", "-d"]
