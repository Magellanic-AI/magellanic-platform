SHELL = /bin/bash

.PHONY: help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build:  ## Pull all containers
	docker compose pull

start:  ## Run all services and apps
	docker compose up -d
	bash ./health.sh
	bash ./script.sh

stop:  ## Stop all services and apps
	docker compose down

clean:  ## Clean after setup
	docker compose rm -a -f
