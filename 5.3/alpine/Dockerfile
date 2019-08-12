#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM alpine:3.10
LABEL maintainer="MilesChou <github.com/MilesChou>"

# Set environment
ENV LUA_VERSION=5.3.5 \
    LUAROCKS_VERSION=2.4.4

# Install dependency packages
RUN set -xe && \
        apk add --no-cache --virtual .build-deps \
            curl \
            gcc \
            libc-dev \
            make \
            readline-dev \
        && \
        apk add --no-cache --virtual .persistent-deps \
            readline \
        && \
        # Install Lua
        wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz && \
        tar zxf lua-${LUA_VERSION}.tar.gz && rm -f lua-${LUA_VERSION}.tar.gz && \
        cd lua-${LUA_VERSION} && \
        make -j $(getconf _NPROCESSORS_ONLN) linux && make install && cd / && \
        rm -rf lua-${LUA_VERSION} && \
        # Install LuaRocks
        wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz && \
        tar zxpf luarocks-${LUAROCKS_VERSION}.tar.gz && rm -f luarocks-${LUAROCKS_VERSION}.tar.gz && \
        cd luarocks-${LUAROCKS_VERSION} && \
        ./configure && \
        make -j $(getconf _NPROCESSORS_ONLN) build && make install && \
        cd .. && rm -rf luarocks-${LUAROCKS_VERSION} && \
        # Remove all build deps
        apk del .build-deps && \
        # Test
        lua -v && luarocks

COPY docker-* /usr/local/bin