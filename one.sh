#!/bin/sh

UNICORN=unicorn
CONFIG_FILE=/var/www/htdocs/dockeeper/config/unicorn.rb

cd /var/www/htdocs/dockeeper/

case "$1" in
	start)
		bundle exec $UNICORN -c $CONFIG_FILE -E production -D
		;;
	stop)
		kill -QUIT `cat tmp/pids/unicorn.pid`
		;;
	restart|force-reload)
		kill -USR2 `cat tmp/pids/unicorn.pid`
		;;
	*)
		echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
		exit 3
		;;
esac
