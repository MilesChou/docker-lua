FROM debian:buster
LABEL maintainer="MilesChou <github.com/MilesChou>"

# Set environment
ARG LUA_VERSION=5.3.5
ARG LUAROCKS_VERSION=2.4.4
ENV LUA_VERSION=${LUA_VERSION} \
    LUAROCKS_VERSION=${LUAROCKS_VERSION}

# Set Build Deps
ENV BUILD_DEPS \
        gcc \
        libc-dev \
        libreadline-dev \
        make \
        unzip \
        wget

# Set Persistent Deps
ENV PERSISTENT_DEPS \
        ca-certificates \
        libreadline7

# Install depandency packages
RUN set -xe && \
        apt-get update -y && apt-get install -y --no-install-recommends --no-install-suggests ${BUILD_DEPS} ${PERSISTENT_DEPS} && \
        # Install Lua
        wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz && \
        tar zxf lua-${LUA_VERSION}.tar.gz && rm -f lua-${LUA_VERSION}.tar.gz && \
        cd lua-${LUA_VERSION} && \
        make linux && make install && cd / && \
        rm -rf lua-${LUA_VERSION} && \
        # Install LuaRocks
        wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz && \
        tar zxf luarocks-${LUAROCKS_VERSION}.tar.gz && rm -f luarocks-${LUAROCKS_VERSION}.tar.gz && \
        cd luarocks-${LUAROCKS_VERSION} && \
        ./configure && \
        make build && make install && \
        cd .. && rm -rf luarocks-${LUAROCKS_VERSION} && \
        # Remove all build time deps
        apt-get remove --purge -y ${BUILD_DEPS} && apt-get autoremove --purge -y && rm -r /var/lib/apt/lists/* && \
        # Test
        lua -v && luarocks

COPY docker-* /usr/local/bin