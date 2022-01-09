FROM alpine:3.15

RUN apk add --no-cache \
    kleopatra \
    ttf-dejavu \
    dbus-x11

ARG USER=kleopatra
ARG HOME=/"$USER"
WORKDIR $HOME

RUN addgroup -S "$USER"
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$HOME" \
    --ingroup "$USER" \
    --no-create-home \
    "$USER"
    
RUN chown "$USER":"$USER" "$HOME"

RUN ln -s /kleopatra/.config /config
RUN ln -s /kleopatra/.gnupg /gnupg

USER kleopatra

ENTRYPOINT ["/bin/ash", "-l", "-c"]
CMD ["/usr/bin/kleopatra"]
