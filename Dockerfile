FROM willfarrell/crontab:latest

ENV CLI_VERSION=1.15.81

#Install aws cli
RUN mkdir -p /aws && \
    apk -Uuv add groff jq less python py-pip && \
    pip install awscli==$CLI_VERSION && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

CMD ["crond", "-f"]