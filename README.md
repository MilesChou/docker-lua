# Docker Lua

[![](https://img.shields.io/docker/stars/mileschou/lua.svg)](https://hub.docker.com/r/mileschou/lua/)
[![](https://img.shields.io/docker/pulls/mileschou/lua.svg)](https://hub.docker.com/r/mileschou/lua/)

Docker base image for Lua, see https://hub.docker.com/r/mileschou/lua/

This repository is a prototype image with [Lua](https://www.lua.org/).

## Supported tags and respective `Dockerfile` links

* [`5.3-alpine`, `5.3`, `alpine`, `latest` (alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/alpine/Dockerfile)
* [`5.3-alpine-luarocks`, `5.3-luarocks`, `alpine-luarocks`, `luarocks` (alpine/luarocks/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/alpine/luarocks/Dockerfile)

## Install dependency using Luarocks

Luarocks using some general dev lib. Use the `docker-luarocks-install` can install easily.

```
docker-luarocks-install busted
```

## Thanks

* [GitHub](https://github.com/)
* [Docker Hub](https://hub.docker.com/)
