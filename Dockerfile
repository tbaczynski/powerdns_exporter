FROM golang:1.8-alpine
ADD . /go/src/github.com/ledgr/powerdns_exporter
WORKDIR /go/src/github.com/ledgr/powerdns_exporter
RUN apk add --no-cache git && \
    go get -v ./... && \
    go build

FROM alpine:latest
EXPOSE 9120
WORKDIR /root
COPY --from=0 /go/src/github.com/ledgr/powerdns_exporter/powerdns_exporter .
ENTRYPOINT ["./powerdns_exporter"]
