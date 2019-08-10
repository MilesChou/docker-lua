#!/usr/bin/make -f

IMAGE := mileschou/lua
.PHONY: alpine

# ------------------------------------------------------------------------------

all: alpine

alpine:
	docker build -t=$(IMAGE) -f alpine/Dockerfile .
