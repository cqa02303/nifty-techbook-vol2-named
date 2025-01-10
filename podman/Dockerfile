# podman build --network host -t pull_named_update:20250109 .
#
FROM docker.io/ubuntu:latest

USER root

RUN apt update -y && apt upgrade -y && apt install -y git bind9-utils

RUN git config --global --add safe.directory /nifty-techbook-vol2-named
COPY gitpull.sh /gitpull.sh
RUN chmod +x /gitpull.sh

CMD ["/gitpull.sh"]