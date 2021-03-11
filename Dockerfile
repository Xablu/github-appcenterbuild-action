FROM ubuntu:latest

LABEL "com.github.actions.name"="Appcenter build starter"
LABEL "com.github.actions.description"="Action in github to call the appcenter api and start a build of a configured app."

LABEL version="0.1.0"
LABEL repository="https://github.com/xablu/github-appcenterbuild-action"
LABEL maintainer="pherms"

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]