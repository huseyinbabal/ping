FROM golang:1.19 as builder
WORKDIR /usr/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o ping -tags build -ldflags '-w' ./cmd/main.go

FROM scratch
COPY --from=builder /usr/src/app/ping /app
CMD ["/app"]
