FROM golang:1.16-alpine AS build

WORKDIR /app

COPY *.go ./
ENV GO111MODULE=off
RUN go build -o /fullcycle-rocks

FROM scratch

WORKDIR /

COPY --from=build /fullcycle-rocks /fullcycle-rocks

ENTRYPOINT ["/fullcycle-rocks"]