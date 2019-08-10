FROM alpine:3.10
LABEL maintainer="MilesChou <github.com/MilesChou>"

# Set environment
ARG LUA_VERSION=5.3.5
ENV LUA_VERSION=${LUA_VERSION}

# Set Build Deps
ENV BUILD_DEPS \
        curl \
        gcc \
        libc-dev \
        make \
        readline-dev

# Set Persistent Deps
ENV PERSISTENT_DEPS \
        readline

# Install depandency packages
RUN set -xe && \
        apk add --no-cache --virtual .build-deps ${BUILD_DEPS} && \
        apk add --no-cache --virtual .persistent-deps ${PERSISTENT_DEPS} && \
        # Install Lua
        curl -R -O http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz && \
        tar zxf lua-${LUA_VERSION}.tar.gz && rm -f lua-${LUA_VERSION}.tar.gz && \
        cd lua-${LUA_VERSION} && \
        make linux && make install && cd / && \
        rm -rf lua-${LUA_VERSION} && \
        # Remove all build time deps
        apk del .build-deps && \
        # Test
        lua -v
