#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM alpine:3.10
LABEL maintainer="MilesChou <github.com/MilesChou>"

# Set environment
ENV LUAJIT_VERSION=2.1.0-beta3 \
    LUAROCKS_VERSION=3.3.1

# Install dependency packages
RUN set -xe && \
        apk add --no-cache --virtual .build-deps \
            ca-certificates \
            gcc \
            libc-dev \
            make \
        && \
        apk add --no-cache \
            libgcc \
        && \
        # Install LuaJIT
        wget https://luajit.org/download/LuaJIT-${LUAJIT_VERSION}.tar.gz && \
        tar zxf LuaJIT-${LUAJIT_VERSION}.tar.gz && rm -f LuaJIT-${LUAJIT_VERSION}.tar.gz && \
        cd LuaJIT-${LUAJIT_VERSION} && \
        make -j $(getconf _NPROCESSORS_ONLN) && make install && \
        cd / && rm -rf LuaJIT-${LUAJIT_VERSION} && \
        # Create link
        [ -e /usr/local/bin/luajit ] || ln -sf luajit-${LUAJIT_VERSION} /usr/local/bin/luajit && \
        # Install LuaRocks
        wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz && \
        tar zxf luarocks-${LUAROCKS_VERSION}.tar.gz && rm -f luarocks-${LUAROCKS_VERSION}.tar.gz && \
        cd luarocks-${LUAROCKS_VERSION} && \
        ./configure \
            --with-lua-include=/usr/local/include/luajit-$(echo $LUAJIT_VERSION | cut -d. -f1).$(echo $LUAJIT_VERSION | cut -d. -f2) \
        && \
        make -j $(getconf _NPROCESSORS_ONLN) build && make install && \
        cd / && rm -rf luarocks-${LUAROCKS_VERSION} && \
        # Remove all build deps
        apk del .build-deps && \
        # Test
        luajit -v && luarocks

COPY docker-* /usr/local/bin
