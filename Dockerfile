# Build Gjam in a stock Go builder container
FROM golang:1.12-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git

ADD . /go-jamodiuma
RUN cd /go-jamodiuma && make gjam

# Pull Gjam into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-jamodiuma/build/bin/gjam /usr/local/bin/

EXPOSE 7058 7059 35290 35290/udp
ENTRYPOINT ["gjam"]