FROM golang:1 AS build-env
WORKDIR /go/src/github.com/kumina/postfix_exporter
COPY *.go ./
RUN go get -tags nosystemd .
RUN CGO_ENABLED=0 go build -tags nosystemd --ldflags '-extldflags "-s -w"' -o bin/postfix_exporter


FROM alpine:3.8
RUN apk --no-cache add ca-certificates

COPY --from=build-env /go/src/github.com/kumina/postfix_exporter/bin/postfix_exporter /usr/local/bin

CMD ["postfix_exporter"]
