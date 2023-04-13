#!/usr/bin/make -f

IMAGE := mileschou/lua
.PHONY: 5.1 5.2 5.3 5.4 jit2.0 jit2.1

# ------------------------------------------------------------------------------

all: 5.1 5.2 5.3 5.4 jit-2.0 jit-2.1

5.1:
	docker build -t=$(IMAGE):5.1 --progress plain -f 5.1/Dockerfile .
	docker build -t=$(IMAGE):5.1-alpine --progress plain -f 5.1/alpine/Dockerfile .

5.2:
	docker build -t=$(IMAGE):5.2 --progress plain -f 5.2/Dockerfile .
	docker build -t=$(IMAGE):5.2-alpine --progress plain -f 5.2/alpine/Dockerfile .

5.3:
	docker build -t=$(IMAGE):5.3 --progress plain -f 5.3/Dockerfile .
	docker build -t=$(IMAGE):5.3-alpine --progress plain -f 5.3/alpine/Dockerfile .

5.4:
	docker build -t=$(IMAGE):5.4 --progress plain -f 5.4/Dockerfile .
	docker build -t=$(IMAGE):5.4-alpine --progress plain -f 5.4/alpine/Dockerfile .

jit-2.0:
	docker build -t=$(IMAGE):jit-2.0 --progress plain -f jit-2.0/Dockerfile .
	docker build -t=$(IMAGE):jit-2.0-alpine --progress plain -f jit-2.0/alpine/Dockerfile .

jit-2.1:
	docker build -t=$(IMAGE):jit-2.1 --progress plain -f jit2.1/Dockerfile .
	docker build -t=$(IMAGE):jit-2.1-alpine --progress plain -f jit-2.1/alpine/Dockerfile .
