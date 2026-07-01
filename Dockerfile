FROM alpine:latest
RUN apk add --no-cache tinyproxy
# Konfigurasi agar Tinyproxy mendengarkan semua IP
RUN sed -i 's/#Listen/Listen/g' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/Port 8888/Port 8080/g' /etc/tinyproxy/tinyproxy.conf && \
    sed -i 's/Allow 127.0.0.1/Allow 0.0.0.0/g' /etc/tinyproxy/tinyproxy.conf
EXPOSE 8080
CMD ["tinyproxy", "-d"]
