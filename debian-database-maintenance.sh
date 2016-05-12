#!/bin/bash

for pid in $(pidof -x $0); do
    if [ $pid != $$ ]; then
	    echo "A database maintenance is already running, please try again later." 1>&2
	    exit 1
    fi
done

sleep 20


if [[ "$1" == "compact" ]]; then
	cozy-monitor compact
elif [[ "$1" == "views" ]]; then
	cozy-monitor compact-all-views
elif [[ "$1" == "cleanup" ]]; then
	cozy-monitor cleanup
else
	echo "unknown command..." 1>&2
	exit 1
fi

exit $?
