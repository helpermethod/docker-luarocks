FROM docker-lua:0.1.0

ARG LUAROCKS_VERSION=3.0.0

RUN apk --no-cache add --virtual build-dependencies \
    gcc \
    libc-dev \
    make \
    readline-dev \
 && wget http://luarocks.github.io/luarocks/releases/luarocks-${LUAROCKS_VERSION}.tar.gz \
 && tar xvf luarocks-${LUAROCKS_VERSION}.tar.gz \
 && cd luarocks-$LUAROCKS_VERSION \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm -rf luarocks-${LUAROCKS_VERSION}.tar.gz luarocks-$LUA_VERSION \
 && apk del build-dependencies
