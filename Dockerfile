FROM golang:1.25-alpine AS build
WORKDIR /src
COPY go.mod ./
COPY cmd ./cmd
RUN go test ./...
RUN CGO_ENABLED=0 go build -o /out/server ./cmd/server

FROM alpine:3.22
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app && mkdir data && chown -R app:app /app
USER app
COPY --from=build /out/server /app/server
EXPOSE 8312
ENTRYPOINT ["/app/server"]
