# Go parameters
BINARY_NAME=tailscale-docker
BINARY_UNIX=$(BINARY_NAME)_unix
REPO=ghcr.io/dathan/tailscale-docker

.PHONY: all
all: docker-build docker-tag docker-push

.PHONY: helmrun
helmrun: docker-build docker-tag
	helm delete tailscale-relay --purge
	helm install --name 'tailscale-relay' --debug ./helm/tailscale-relay/

# Build docker containers
.PHONY: docker-build
docker-build:
				docker build  \
					-t $(or ${dockerImage},$(BINARY_NAME)-release) .
.PHONY: docker-tag
docker-tag:
			docker tag `docker image ls --filter 'reference=$(BINARY_NAME)-release' -q` $(REPO):`git rev-parse HEAD`
			docker tag `docker image ls --filter 'reference=$(BINARY_NAME)-release' -q` $(REPO):latest

# Push the container
.PHONY: docker-push
docker-push: docker-build docker-tag
				docker push $(REPO):latest


.PHONY: docker-clean
docker-clean:
				docker rmi `docker image ls --filter 'reference=$(BINARY_NAME)-*' -q`
