FROM alpine

COPY src/shell/entrypoint.sh /
COPY src/shell/auth.sh /
COPY src/templates/aws-config.tmpl /srv/
COPY src/templates/aws-credentials.tmpl /srv/

RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    curl \
    jq \
    python3 \
    py3-pip && \
    pip3 install --upgrade pip && \
    pip3 install --no-cache-dir awscli && \
    chmod +x /entrypoint.sh && \
    chmod +x /auth.sh && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
