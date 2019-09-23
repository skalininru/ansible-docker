FROM alpine:3.10

RUN apk add --no-cache --purge -uU ansible ansible-lint sudo curl ca-certificates openssh-client \
    && mkdir -p /etc/ansible \
    && echo 'localhost' > /etc/ansible/hosts \
    && mkdir /ansible \
    && rm -rf /var/cache/apk/* /tmp/*

WORKDIR /ansible

ENTRYPOINT ["ansible-playbook"]