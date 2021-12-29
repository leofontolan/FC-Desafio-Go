FROM golang:1.18-rc-alpine as builder

WORKDIR /go/src/app
COPY fcr.go /go/src/app

RUN go build -o /app fcr.go

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT ["/app"]