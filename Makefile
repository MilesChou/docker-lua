#!/usr/bin/make -f

IMAGE := mileschou/lua
.PHONY: alpine debian

# ------------------------------------------------------------------------------

all: alpine debian

alpine:
	docker build -t=$(IMAGE) -f alpine/Dockerfile .

debian:
	docker build -t=$(IMAGE) -f debian/Dockerfile .
