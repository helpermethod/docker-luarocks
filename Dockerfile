FROM helpermethod/docker-lua:0.3.0

USER root
WORKDIR /

ARG LUAROCKS_VERSION=3.0.1
ARG LUAROCKS_DOWNLOAD_SHA256=b989c4b60d6c9edcd65169e5e42fcffbd39cdbebe6b138fa5aea45102f8d9ec0

RUN set -o errexit -o nounset \
 && apk --no-cache add --virtual build-dependencies \
    make \
 && apk --no-cache add \
    curl \
    gcc \
    git \
    libc-dev \
    openssl \
    zip
 && printf 'Downloading LuaRocks\n' \
 && wget -O luarocks.tar.gz https://luarocks.github.io/luarocks/releases/luarocks-${LUAROCKS_VERSION}.tar.gz \
 && printf 'Checking download hash\n' \
 && printf '%s  luarocks.tar.gz' "$LUAROCKS_DOWNLOAD_SHA256" | sha256sum -c - \
 && printf 'Installing LuaRocks\n' \
 && tar xvf luarocks.tar.gz \
 && cd luarocks-$LUAROCKS_VERSION \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -rf luarocks.tar.gz luarocks-$LUAROCKS_VERSION \
 && apk del build-dependencies

USER lua
WORKDIR /home/lua
