FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY compress_and_encrypt.sh /usr/local/bin/compress_and_encrypt
RUN chmod +x /usr/local/bin/compress_and_encrypt

CMD ["compress_and_encrypt"]