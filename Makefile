IMAGE := quantum-key-transfer
PORT ?= 8312

.PHONY: test build run

test:
	go test ./...

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -e PORT=$(PORT) -p $(PORT):$(PORT) $(IMAGE)
