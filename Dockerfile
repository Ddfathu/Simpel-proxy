FROM alpine:latest
RUN apk add --no-cache microsocks
EXPOSE 1080
# Menjalankan SOCKS5 polosan tanpa user/password agar Worker lu bisa langsung dial TCP
CMD ["microsocks", "-p", "1080"]
