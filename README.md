# Docker Lua

[![](https://img.shields.io/docker/stars/mileschou/lua.svg)](https://hub.docker.com/r/mileschou/lua/)
[![](https://img.shields.io/docker/pulls/mileschou/lua.svg)](https://hub.docker.com/r/mileschou/lua/)

Docker base image for Lua, see https://hub.docker.com/r/mileschou/lua/

This repository is a prototype image with [Lua](https://www.lua.org/) / [LuaJIT](https://luajit.org/) and [LuaRocks v2.4.4](https://luarocks.org/).

## Supported tags and respective `Dockerfile` links

* [`5.3`, `latest` (5.3/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/5.3/Dockerfile)
* [`5.3-alpine`, `alpine` (5.3/alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/5.3/alpine/Dockerfile)
* [`5.2` (5.2/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/5.2/Dockerfile)
* [`5.2-alpine` (5.2/alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/5.2/alpine/Dockerfile)
* [`5.1` (5.1/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/5.1/Dockerfile)
* [`5.1-alpine` (5.1/alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/5.1/alpine/Dockerfile)

LuaJIT tags in here:

* [`jit-2.1` (jit2.1/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/jit2.1/Dockerfile)
* [`jit-2.1-alpine` (jit2.1/alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/jit2.1/alpine/Dockerfile)
* [`jit-2.0`, `jit` (jit2.0/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/jit2.0/Dockerfile)
* [`jit-2.0-alpine` `jit-alpine` (jit2.0/alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/jit2.0/alpine/Dockerfile)


## Install dependency using LuaRocks

LuaRocks will use some general development library. Use the `docker-luarocks-install` script can install easily.

```
docker-luarocks-install busted
```

## Thanks

* [GitHub](https://github.com/)
* [Docker Hub](https://hub.docker.com/)
