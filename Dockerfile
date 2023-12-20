FROM debian:12 AS builder

ENV http_proxy=http://10.233.0.1:7890
ENV https_proxy=http://10.233.0.1:7890

COPY ./init.sh /init.sh

RUN chmod +x /init.sh && /init.sh && \
    apt update && \
    apt install trivy -y && \
    trivy server --download-db-only

FROM alpine:3

WORKDIR /app

COPY --from=builder /root/.cache/trivy/db /app/db

ENTRYPOINT mkdir -p /app/release && cp /app/db/* /app/release/