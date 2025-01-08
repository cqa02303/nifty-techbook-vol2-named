#!/bin/bash

LOG=/log/gitpull.log

cd /

rst=0
git clone https://github.com/cqa02303/nifty-techbook-vol2-named.git > $LOG 2>&1
# 新規: $?=0 / 既存: $? = 128
if [ $? = 0 ]; then
	echo 'need restart' >> $LOG
	rst=1
fi

cd nifty-techbook-vol2-named
git fetch >> $LOG
ret=`git pull`
echo $ret >> $LOG
if [ "$ret" = "Already up to date." ]; then
        echo no change >> $LOG
else
        echo change >> $LOG
	rst=1
        # zoneファイルのserial(SOA)を得るには
        # named-checkzone -D -q cqa02303.work cqa02303.work | head -1
fi

# bindにファイルを渡すためオーナーを変更
chown -R bind:bind /log >> $LOG 2>&1
chown -R bind:bind /nifty-techbook-vol2-named >> $LOG 2>&1

# 更新されていればrndc reload / reconfig
if [ $rst = 1 ]; then
	echo 'restart...' >> $LOG
        rndc reload >> $LOG
fi

