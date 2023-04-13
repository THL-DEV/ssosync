FROM golang:1.19-buster as builder
RUN apt-get update && apt-get install make
WORKDIR /work
COPY . .
RUN make go-build
FROM golang:1.19-buster
COPY --from=builder /work/ssosync /usr/bin/ssosync
ENTRYPOINT ["/usr/bin/ssosync"]
