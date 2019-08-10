#!/usr/bin/make -f

IMAGE := mileschou/lua
.PHONY: alpine

# ------------------------------------------------------------------------------

all: alpine

alpine:
	docker build -t=$(IMAGE) -f alpine/Dockerfile .
	docker build -t=$(IMAGE):luarocks -f alpine/luarocks/Dockerfile .
