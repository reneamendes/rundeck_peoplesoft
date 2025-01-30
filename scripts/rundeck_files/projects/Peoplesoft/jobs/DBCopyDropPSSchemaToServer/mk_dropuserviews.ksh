#!/bin/ksh
#
# This script creates scripts to be called by "dropuserviews.ksh".
# Sample call:
# ./mk_dropuserviews.ksh SAPSR3 16
#
# Call with option "-r" to access the database vie TNS instead of bequeath.
#
# Sample call:
# ./mk_dropuserviews.ksh -r user/password@tns-alias SAPSR3 16 (default is number of CPUs available)
#

# See: https://wiki.loopback.org/confluence/x/AgCw

CPULOG=number_cpu.log

if [ -f $CPULOG ]
  then
     rm $CPULOG
fi

TMP=$0.$$
usage() {
	echo "usage: $0 [ -r user/password@tns-alias ] <Schema-Owner (e.g. SAPSR3)> <number of parallel threads (1 <= n <= $CPUTHREADS)>"
	exit 1
}

get_cpunumber() {
        sqlplus -s "$REMOTECONNECTION" << EOF
        spool $CPULOG
        set echo off
        set pagesize 0
        set heading off
        set feedback off
        set verify off
        set termout off
        set trimspool on
        select value from v\$parameter where name='cpu_count';
        spool off;
        exit;
EOF
}


get_viewlist() {
	sqlplus "$REMOTECONNECTION" << /EOF > $TMP
	spool $NAME.log
	set echo on
	set lines 140
	set trimout on
	set trimspool on
	set verify off
	column "Owner" format a30
	column "View" format a40
	select owner "Owner", view_name "View"
		from dba_views
		where owner='$OWNER'
		order by 1, 2
	;
/EOF
}

REMOTECONNECTION=""
while true; do
	case "$1" in
	-r)	REMOTECONNECTION="$2"
		shift 2
		;;
	-h)	usage
		;;
	-*)	echo "Unbekannter Parameter: \"$1\""
		usage
		;;
	*)	break
		;;
	esac
done
[[ "X$REMOTECONNECTION" = "X" ]] && REMOTECONNECTION="/ as sysdba"

[[ "X$1" = "X" ]] && usage

get_cpunumber
CPUTHREADS=`cat $CPULOG`

OWNER=`echo $1 | tr '[:lower:]' '[:upper:]'`
typeset -i THREADS=$2
[[ $THREADS -lt 1 ]] || [[ $THREADS -gt 16 ]] && usage

NAME=`basename $0 | cut -f1 -d"."`
get_viewlist $OWNER

HOST=`hostname | cut -f1 -d"."`
USER=$OWNER 
SID=$ORACLE_SID
typeset -i I=0
rm ./dropuserviews_${HOST}_${SID}_${USER}.[0-9]*.sh* 2> /dev/null
while [[ $I -lt $THREADS ]]; do
	I=$I+1
	cat << /EOF > ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh
	cat << /EF | sqlplus "$REMOTECONNECTION"
	spool ./dropuserviews_${HOST}_${SID}_${USER}.$I.log
	set termout off echo off feed off trimspool on head off pages 0
	set timing on
	set linesize 200
	select * from dual;
/EOF
done

typeset -i I=0
grep "^$OWNER" $NAME.log > $TMP
while read OWN VIEW; do
	###echo "$OWN $VIEW"
	I=$I+1
	[[ $I -gt $THREADS ]] && I=1
	echo "drop view $OWN.\"$VIEW\";" >> ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh.tmp
done < $TMP

#echo "created $THREADS scripts:"
I=0
while [[ $I -lt $THREADS ]]; do
	I=$I+1
	typeset -i J=0
	if [ -f ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh.tmp ]; then
		J=`wc ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh.tmp | awk '{print $1}'`
		cat ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh.tmp >> ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh
		echo "./dropuserviews_${HOST}_${SID}_${USER}.$I.sh     number of entries: $J"
		echo "/EF" >> ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh
		chmod 755 ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh
		rm ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh.tmp
	else
		rm ./dropuserviews_${HOST}_${SID}_${USER}.$I.sh
	fi
done
rm $TMP

echo "Ready."
