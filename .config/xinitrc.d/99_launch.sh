IFS=';'
for i in $DAEMONS; do
	unset IFS
	(exec $i &)
done

exec ${STARTUP:-dwm}
