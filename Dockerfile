FROM golang:alpine as builder
RUN apk update && apk add git glide build-base
ENV GOPATH $HOME/go
RUN go get -d github.com/dilcheck/aergo-esindexer
WORKDIR ${GOPATH}/src/github.com/dilcheck/aergo-esindexer
RUN git fetch && git checkout 324c77fc7a7fd3968a38d90e3b4ceabebdd67a07 && git submodule init && git submodule update
RUN make all

FROM alpine:3.8
RUN apk add libgcc
COPY --from=builder $HOME/go/src/github.com/dilcheck/aergo-esindexer/bin/* /usr/local/bin/
CMD ["esindexer"]
