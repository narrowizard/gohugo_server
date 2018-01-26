FROM golang:1.8.3 as builder
RUN go get github.com/gohugoio/hugo
WORKDIR /go/src/github.com/gohugoio/hugo
RUN CGO_ENABLED=0 GOOS=linux go build -a -v -o hugo .

FROM alpine:latest
COPY --from=builder /go/src/github.com/gohugoio/hugo/hugo /bin
VOLUME ["/root/hugo"]
WORKDIR /root/hugo
EXPOSE 1313
CMD ["/bin/hugo","server","--bind", "0.0.0.0"]
