#!/bin/bash

if pidof -o %PPID -x "$0"; then
   exit 1
fi

WONDER=/usr/sbin/wondershaper
INTERFACE=enp2s0
NETRATE=102400
TVHRATE=13312


$WONDER clear $INTERFACE

TMP_VIEWCNT=0
while true; do
	sleep 3

	VIEWCNT=`curl -s http://id:pw@ipaddr:9981/api/status/subscriptions | jq .totalCount`
	if [ "$VIEWCNT" -ne "$TMP_VIEWCNT" ]; then
		DNRATE=`expr $NETRATE - $TVHRATE \* $VIEWCNT`
		UPRATE=`expr $NETRATE - $TVHRATE \* $VIEWCNT`
		$WONDER $INTERFACE $DNRATE $UPRATE
		TMP_VIEWCNT=$VIEWCNT
		echo "CURRNT COUNT : $VIEWCNT | CURRENT SPEED : $DNRATE / $UPRATE"
	fi

done 

exit 0
