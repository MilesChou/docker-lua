#!/usr/bin/make -f

IMAGE := mileschou/lua
.PHONY: 5.1 5.2 5.3

# ------------------------------------------------------------------------------

all: 5.1 5.2 5.3

5.1:
	docker build -t=$(IMAGE):5.1 -f 5.1/Dockerfile .
	docker build -t=$(IMAGE):5.1-alpine -f 5.1/alpine/Dockerfile .

5.2:
	docker build -t=$(IMAGE):5.2 -f 5.2/Dockerfile .
	docker build -t=$(IMAGE):5.2-alpine -f 5.2/alpine/Dockerfile .

5.3:
	docker build -t=$(IMAGE):5.3 -f 5.3/Dockerfile .
	docker build -t=$(IMAGE):5.3-alpine -f 5.3/alpine/Dockerfile .
