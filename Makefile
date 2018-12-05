#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

SHELL = /bin/sh

IMAGES_PREFIX := $(shell basename $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

IMAGE_10_ALPINE_TAG = 10-alpine
IMAGE_11_ALPINE_TAG = 11-alpine
IMAGE_ALPINE_TAG = alpine
IMAGE_LATEST_TAG = latest
CONTAINER_IMAGE = "feugene/$(IMAGES_PREFIX)"

docker_bin := $(shell command -v docker 2> /dev/null)

all_tags = $(IMAGE_10_ALPINE_TAG) \
					 $(IMAGE_11_ALPINE_TAG) \
           $(IMAGE_ALPINE_TAG) \
					 $(IMAGE_LATEST_TAG)

.PHONY : help build clean \
         build-10-alpine build-11-alpine build-alpine-latest build-latest
.DEFAULT_GOAL := help

# This will output the help for each task. thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build-10-alpine:
	$(docker_bin) build \
	  --tag "$(CONTAINER_IMAGE):$(IMAGE_10_ALPINE_TAG)" \
	  -f ./dockerfiles/Dockerfile.10-alpine ./dockerfiles

build-11-alpine:
	$(docker_bin) build \
	  --tag "$(CONTAINER_IMAGE):$(IMAGE_11_ALPINE_TAG)" \
	  -f ./dockerfiles/Dockerfile.11-alpine ./dockerfiles

build-alpine-latest:
	$(docker_bin) build \
	  --tag "$(CONTAINER_IMAGE):$(IMAGE_ALPINE_TAG)" \
	  -f ./dockerfiles/Dockerfile.alpine ./dockerfiles

build-latest:
	$(docker_bin) build \
	  --tag "$(CONTAINER_IMAGE):$(IMAGE_LATEST_TAG)" \
	  -f ./dockerfiles/Dockerfile.latest ./dockerfiles

build: build-alpine-latest build-10-alpine build-11-alpine build-latest ## Build all Docker images locally

push: ## Push to registry
	$(foreach tag,$(all_tags),$(docker_bin) push "$(CONTAINER_IMAGE):$(tag)";)

clean: ## Remove images from local registry
	$(foreach tag,$(all_tags),$(docker_bin) rmi -f "$(CONTAINER_IMAGE):$(tag)";)
