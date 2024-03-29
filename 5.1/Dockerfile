#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM debian:bullseye-slim

LABEL org.opencontainers.image.source="https://github.com/MilesChou/docker-lua" \
    repository="https://github.com/MilesChou/docker-lua" \
    maintainer="MilesChou <jangconan@gmail.com>"

# Set environment
ENV LUA_VERSION=5.1.5 \
    LUAROCKS_VERSION=3.9.2

# Set build deps
ENV BUILD_DEPS \
        gcc \
        libc-dev \
        libreadline-dev \
        make \
        unzip \
        wget

# Install dependency packages
RUN set -xe && \
        apt-get update -y && apt-get install -y --no-install-recommends --no-install-suggests \
            ${BUILD_DEPS} \
            # Persistent Deps
            ca-certificates \
            libreadline8 \
            libncurses6 \
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
        apt-get remove --purge -y ${BUILD_DEPS} && apt-get autoremove --purge -y && rm -r /var/lib/apt/lists/* && \
        # Test
        lua -v && luarocks

COPY docker-* /usr/local/bin