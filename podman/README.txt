BINDの定義更新用コンテナ

# build
podman build -t pull_named_update:`date "+%Y%m%d` .
※ podman build -t pull_named_update:20240212 .

in VyOS
generate container image pull_named_update path /usr/lib/live/mount/persistence/nifty-techbook-vol2-named/script/podman

# test command 
mkdir log
mkdir nifty-techbook-vol2-named
podman run --name bindt -it -v ./nifty-techbook-vol2-named:/nifty-techbook-vol2-named -v ./log:/log --rm pull_named_update:20240212

in VyOS
podman run --rm --name bindchk --net host -v /usr/lib/live/mount/persistence/nifty-techbook-vol2-named:/nifty-techbook-vol2-named -v /usr/lib/live/mount/persistence/nifty-techbook-vol2-named:/etc/bind -v /usr/lib/live/mount/persistence/named_log:/log pull_named_update:latest
# git update: /nifty-techbook-vol2-named
# rndc config: /etc/bind
# logging: /log
