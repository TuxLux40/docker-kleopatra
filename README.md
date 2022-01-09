# docker-kleopatra

A small docker container for running [Kleopatra](https://github.com/KDE/kleopatra). 

## Examples

**Docker Run**
```shell
docker run --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /config:/config \
  -v $HOME/.gnupg:/gnupg \
  -e DISPLAY=unix$DISPLAY \
  thelolagemann/kleopatra:latest
```

**Docker compose**
```yaml
version: "2.1"

services:
  kleopatra:
    container_name: kleopatra
    image: thelolagemann/kleopatra:latest
    volumes:
      - /config:/config
      - /tmp/.X11-unix:/tmp/.X11-unix
      - $HOME/.gnupg:/gnupg
    environment:
      - DISPLAY=unix$DISPLAY
```