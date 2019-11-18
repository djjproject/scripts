#!/bin/bash
FROM=""
TO=""
LOG=/var/log/copy.log

case $1 in
	start)
		nohup rclone copy "$FROM" "$TO" -P > $LOG 2>&1 &
		;;
	stop)
		pkill -9 -ef "rclone copy $FROM"
		;;
	status)
		tail -f /var/log/copy.log
		;;
	*)
		echo "USAGE :: copy start|stop|status"
		;;
esac
