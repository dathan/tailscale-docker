# Go parameters
BINARY_NAME=tailscale-docker
BINARY_UNIX=$(BINARY_NAME)_unix
REPO=docker.pkg.github.com/dathan/tailscale-docker/tailscale-docker

.PHONY: all
all: docker-build docker-tag docker-push

# Build docker containers
.PHONY: docker-build
docker-build:
				docker build  \
					-t $(or ${dockerImage},$(BINARY_NAME)-release) .
.PHONY: docker-tag
docker-tag:
			docker tag `docker image ls --filter 'reference=$(BINARY_NAME)-release' -q` $(REPO):`git rev-parse HEAD`

# Push the container
.PHONY: docker-push
docker-push: docker-build docker-tag
				docker push $(REPO):`git rev-parse HEAD`


.PHONY: docker-clean
docker-clean:
				docker rmi `docker image ls --filter 'reference=$(BINARY_NAME)-*' -q`
