FROM alpine:latest
RUN apk add --no-cache python3
EXPOSE 1080
# Menggunakan script python sederhana untuk menjalankan SOCKS5
CMD ["python3", "-c", "import socket, select, threading; \
    def handle(c): \
        r = c.recv(1024); c.send(b'\x05\x00'); r = c.recv(1024); c.send(b'\x05\x00\x00\x01\x00\x00\x00\x00\x00\x00'); \
        while True: \
            rs, _, _ = select.select([c], [], []); \
            if not rs: break; \
            d = c.recv(4096); \
            if not d: break; \
            c.send(d); \
    s = socket.socket(); s.bind(('0.0.0.0', 1080)); s.listen(5); \
    while True: \
        c, a = s.accept(); threading.Thread(target=handle, args=(c,)).start()"]
