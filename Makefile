OS_ARCH := $(shell uname -m)
ifeq ($(OS_ARCH), arm64)
TARGETARCH := arm64
else
TARGETARCH := "amd64"
endif

NODE_IMAGE := ''
CYPRESS_IMAGE := ''

all: help 

vars: ## print vars
	@echo "OS_ARCH: $(OS_ARCH)"
	@echo "TARGETARCH: $(TARGETARCH)"
	@echo "IMAGE_NAME: $(IMAGE_NAME)"

build-node: ## Build using node base image
	@docker build --build-arg IMAGE_NAME=node:14.18.0 -t test-node:14.18.0 -f Dockerfile .

build-cypress: ## Build using cypress base image
	@docker build --build-arg IMAGE_NAME=cypress/included:8.7.0 -t "test-cypress/included:8.7.0" -f Dockerfile .

test-node: ## Run benchmark using node base image
	@docker run --rm "test-node:14.18.0"

test-cypress: ## Run benchmark using cypress base image
	@docker run --rm "cypress/included:8.7.0"

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

