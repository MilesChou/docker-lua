#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM alpine:3.16

LABEL org.opencontainers.image.source="https://github.com/MilesChou/docker-lua" \
    repository="https://github.com/MilesChou/docker-lua" \
    maintainer="MilesChou <jangconan@gmail.com>"

# Set environment
ENV LUA_VERSION=5.2.4 \
    LUAROCKS_VERSION=3.9.2

# Install dependency packages
RUN set -xe && \
        apk add --no-cache --virtual .build-deps \
            curl \
            gcc \
            g++ \
            libc-dev \
            make \
            readline-dev \
        && \
        apk add --no-cache \
            readline \
        && \
        # Install Lua
        wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz && \
        tar zxf lua-${LUA_VERSION}.tar.gz && rm -f lua-${LUA_VERSION}.tar.gz && \
        cd lua-${LUA_VERSION} && \
        make -j $(getconf _NPROCESSORS_ONLN) linux && make install && \
        cd / && rm -rf lua-${LUA_VERSION} && \
        # Install LuaRocks
        wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz && \
        tar zxf luarocks-${LUAROCKS_VERSION}.tar.gz && rm -f luarocks-${LUAROCKS_VERSION}.tar.gz && \
        cd luarocks-${LUAROCKS_VERSION} && \
        ./configure && \
        make -j $(getconf _NPROCESSORS_ONLN) build && make install && \
        cd / && rm -rf luarocks-${LUAROCKS_VERSION} && \
        # Remove all build deps
        apk del .build-deps && \
        # Test
        lua -v && luarocks

COPY docker-* /usr/local/bin
