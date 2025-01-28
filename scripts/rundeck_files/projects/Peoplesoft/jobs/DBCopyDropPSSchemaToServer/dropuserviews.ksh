#!/bin/ksh
#
# This script can be called after running mk_dropuserviews.ksh.
# Files dropuserviews_<host>_<sid>_<schema>.<n>.sh must already exist.
#
# Option "-r user/password/@tns-alias" has to be used here if it has been used before.

# See: https://wiki.loopback.org/confluence/x/AgCw

usage() {
	echo "usage: $0 [ -r user/password@tns-alias ]"
	exit 1
}

REMOTECONNECTION=""
while true; do
	case "$1" in
	-r)	REMOTECONNECTION="$2"
		shift 2
		;;
	-h)	usage
		;;
	-*)	echo "Unknown Parameter: \"$1\""
		usage
		;;
	*)	break
		;;
	esac
done
[[ "X$REMOTECONNECTION" = "X" ]] && REMOTECONNECTION="/ as sysdba"

OS="`uname`"

if [ "X`echo $OS | grep -i linux`" != "X" ]; then
        SORT="env LC_ALL=C sort"
else
        SORT=sort
fi

HOST=`hostname | cut -f1 -d"."`
SID=$ORACLE_SID
typeset -i THREADS=`ls dropuserviews_${HOST}_${SID}_*.[0-9]*.sh 2> /dev/null | wc -l`
[[ $THREADS -le 0 ]] && {
	echo "Obly found $THREADS scripts called ./dropuserviews_${HOST}_${SID}_*.<n>.sh ."
	exit 1
}

USER=`head dropuserviews_${HOST}_${SID}_*.1.sh | grep "drop view" | cut -f3 -d" " | cut -f1 -d'.' | $SORT -u`
###USER=`ls dropuserviews_${HOST}_${SID}_*.1.sh | cut -f1 -d"." | cut -f4 -d"_"`	# does not work if "_" is part of any field
USERS=`echo $USER | sed "s/ /','/g"`
echo "Staring $THREADS processes..."
date +'%d.%m.%Y %H:%M:%S'
ls dropuserviews_${HOST}_${SID}_*.[0-9]*.sh | while read FILE; do
	NAME=`echo $FILE | cut -f1,2 -d"."`
	touch ./$NAME.log
	./$FILE > ./$NAME.lst 2>&1 &
done



getobj() {
	echo "select 'Number of views: ' || count(*) from dba_views where owner in ('$USERS');" | sqlplus -S "$REMOTECONNECTION"
}



echo "Waiting for all processes to finish..."
date +'%d.%m.%Y %H:%M:%S'
getobj
TMPFILE=./dropuserviews.tmp.$$
ps -ef | grep dropuserviews | grep " $$ " | grep -v grep > $TMPFILE
typeset -i NP=`wc -l $TMPFILE | awk '{print $1}'`
while [[ $NP -gt 1 ]]; do
	echo "`date +'%d.%m.%Y %H:%M:%S'` Number of processes: $NP"
	cat $TMPFILE
	sleep 30
	getobj
	ps -ef | grep dropuserviews | grep " $$ " | grep -v grep > $TMPFILE
	NP=`wc -l $TMPFILE | awk '{print $1}'`
done

rm -rf $TMPFILE 2> /dev/null
date +'%d.%m.%Y %H:%M:%S'
echo "Ready - $USER can now be dropped:"
echo "drop $USER cascade;"
