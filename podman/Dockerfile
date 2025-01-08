# command.1
# podman build -t pull_named_update:20240212 .
#
# command.2
# generate container image pull_named_config path .
#
FROM internetsystemsconsortium/bind9:9.18

USER root

RUN apt update -y && apt upgrade -y && apt install -y git
RUN git config --global --add safe.directory /nifty-techbook-vol2-named
COPY gitpull.sh /gitpull.sh
RUN chmod +x /gitpull.sh

CMD ["/gitpull.sh"]
