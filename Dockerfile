FROM golang:1.17.3-alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN go build -ldflags "-s -w" hello.go

FROM scratch
COPY --from=builder /go/src/app/hello .
ENTRYPOINT ["./hello"]