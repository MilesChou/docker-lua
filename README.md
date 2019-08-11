# Docker Lua

[![](https://img.shields.io/docker/stars/mileschou/lua.svg)](https://hub.docker.com/r/mileschou/lua/)
[![](https://img.shields.io/docker/pulls/mileschou/lua.svg)](https://hub.docker.com/r/mileschou/lua/)

Docker base image for Lua, see https://hub.docker.com/r/mileschou/lua/

This repository is a prototype image with [Lua v5.3.5](https://www.lua.org/) and [LuaRocks v2.4.4](https://luarocks.org/).

## Supported tags and respective `Dockerfile` links

* [`5.3-debian`, `5.3`, `debian`, `latest` (debian/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/debian/Dockerfile)
* [`5.3-alpine`, `alpine` (alpine/Dockerfile)](https://github.com/MilesChou/docker-lua/blob/master/alpine/Dockerfile)

## Install dependency using LuaRocks

LuaRocks using some general dev lib. Use the `docker-luarocks-install` can install easily.

```
docker-luarocks-install busted
```

## Thanks

* [GitHub](https://github.com/)
* [Docker Hub](https://hub.docker.com/)
