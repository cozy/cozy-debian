#
# Regular cron jobs for the cozy package
#
0 4	* * *	root	[ -x /usr/bin/cozy_maintenance ] && /usr/bin/cozy_maintenance
