# docker-luarocks

A Docker image for bulding [Lua](https://www.lua.org/) applications.

[![Docker Build Status](https://img.shields.io/docker/build/helpermethod/docker-luarocks.svg)](https://hub.docker.com/r/helpermethod/docker-luarocks)
[![Docker Automated build](https://img.shields.io/docker/automated/helpermethod/docker-luarocks.svg)](https://hub.docker.com/r/helpermethod/docker-luarocks)
[![Docker Pulls](https://img.shields.io/docker/pulls/helpermethod/docker-luarocks.svg)](https://hub.docker.com/r/helpermethod/docker-luarocks)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/helpermethod/docker-luarocks/master/LICENSE)

## Features

* based on [docker-lua](https://github.com/helpermethod/docker-lua)
* runs as non-root user by default
* suitable as a base image

## Usage

## Running a prebuilt image

```sh
# run the latest version
$ docker run -it helpermethod/docker-luarocks sh
# run a specific version
$ docker run -it helpermethod/docker-luarocks:0.5.0 sh
```

## Using docker-luarocks as a base image

```dockerfile
FROM helpermethod/docker-luarocks:0.5.0

USER ROOT
WORKDIR /

# add your own instructions here

USER lua
WORKDIR lua
```
