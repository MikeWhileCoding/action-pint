FROM alpine:3.20

ENV REVIEWDOG_VERSION=v0.20.3

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/fd59714416d6d9a1c0692d872e38e7f8448df4fc/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

# TODO: Install a linter and/or change docker image as you need.
RUN apk --no-cache add git php composer php-tokenizer php-xml

RUN composer global require laravel/pint
ENV PATH="/root/.composer/vendor/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
