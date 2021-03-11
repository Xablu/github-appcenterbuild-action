FROM alpine:latest

LABEL "com.github.actions.name"="Appcenter build starter"
LABEL "com.github.actions.description"="Action in github to call the appcenter api and start a build of a configured app."

RUN apk update && apk add --no-cache curl
RUN rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]