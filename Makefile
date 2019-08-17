SHELL := /bin/bash

TRAVIS_BRANCH ?= $(shell git rev-parse --abbrev-ref HEAD 2> /dev/null || echo "unstable_$(date +%s)")
TRAVIS_COMMIT ?= $(shell git rev-parse --short HEAD 2> /dev/null || echo "unstable_$(date +%s)")
app           ?= $(shell echo "$${PWD\#\#*/}")
build_date    ?= $(shell date -u +%FT%T.%S%Z)
img           ?= ${ns}/${app}:${tag}
ns            ?= gruen
tag           ?= $(shell sed 's|/|_|g' <<< ${TRAVIS_BRANCH})
build_args    ?= --build-arg BRANCH_NAME=${TRAVIS_BRANCH} --build-arg BUILD_DATE=${build_date} --build-arg COMMIT_SHA=${TRAVIS_COMMIT}
build         ?= build ${build_args} -t ${img} .

.PHONY: build
build:; docker ${build}
.PHONY: clean
clean:; docker rmi ${img}
.PHONY: lint
lint:; docker run -i --rm hadolint/hadolint:latest < Dockerfile
.PHONY: push
push:; docker push ${img}

ifndef V
  .SILENT:
endif
