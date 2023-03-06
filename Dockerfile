# ubuntu:22.04
FROM ubuntu@sha256:b2175cd4cfdd5cdb1740b0e6ec6bbb4ea4892801c0ad5101a81f694152b6c559 as builder

ADD binary-linux-amd64/binary-linux-amd64 /app
# https://github.com/actions/upload-artifact/issues/38
RUN chmod 755 /app

FROM gcr.io/distroless/static@sha256:3c5767883bc3ad6c4ad7caf97f313e482f500f2c214f78e452ac1ca932e1bf7f

COPY --from=builder /app /app

ENTRYPOINT [ "/app" ]
