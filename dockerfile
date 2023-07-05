FROM golang:1.20-alpine as base

RUN mkdir /hello

ADD . /hello

WORKDIR /hello

RUN go build -o main .

FROM scratch

WORKDIR /hello

COPY --from=base /hello .

ENTRYPOINT [ "/hello/main" ]