FROM golang as builder

WORKDIR /go/src/s3-proxy
COPY . .
RUN go get && go build

FROM scratch

COPY --from=builder /go/src/s3-proxy/s3-proxy /s3-proxy

ENTRYPOINT ["/s3-proxy"]