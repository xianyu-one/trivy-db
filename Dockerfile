FROM debian:12 AS builder

COPY ./init.sh /init.sh

RUN chmod +x /init.sh && /init.sh && \
    apt update && \
    apt install trivy -y && \
    trivy server --download-db-only

FROM alpine:3

WORKDIR /app

COPY --from=builder /root/.cache/trivy/db /app/db

ENTRYPOINT mkdir -p /app/release && cp /app/db/* /app/release/ && chmod 777 /app/release/*