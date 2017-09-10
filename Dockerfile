FROM golang:1.8
ADD . /go/src/github.com/ledgr/powerdns_exporter
WORKDIR /go/src/github.com/ledgr/powerdns_exporter
RUN go get -v ./... && \
    go build

FROM alpine:latest
EXPOSE 9120
WORKDIR /root
COPY --from=0 /go/src/github.com/ledgr/powerdns_exporter/powerdns_exporter .
CMD ["./powerdns_exporter"]
