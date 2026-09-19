FROM alpine:latest
RUN apk add --no-cache unzip wget
WORKDIR /app
RUN wget -q https://github.com/XTLS/Xray-core/releases/download/v1.8.24/Xray-linux-64.zip \
    && unzip -o Xray-linux-64.zip \
    && chmod +x xray \
    && rm Xray-linux-64.zip
COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
