FROM golang:1.8.3 as builder
RUN go get github.com/gohugoio/hugo
WORKDIR /go/src/github.com/gohugoio/hugo
RUN CGO_ENABLED=0 GOOS=linux go build -a -v -o hugo .

FROM alpine:latest
VOLUME ["/root/hugo"]
COPY --from=builder /go/src/github.com/gohugoio/hugo/hugo /bin
WORKDIR /root/hugo
CMD ["/bin/hugo","server"]
