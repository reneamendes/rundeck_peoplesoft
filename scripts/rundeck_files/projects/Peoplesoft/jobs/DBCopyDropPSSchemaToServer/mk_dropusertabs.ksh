#!/bin/ksh
#
# The script created scripts to be executed by "dropusertabs.ksh".
# Sample call:
# ./mk_dropusertabs.ksh SAPSR3 16
#
# Call this script with option "-r" when not running against a local database ("sys as sysdba").
# Sample call:
# ./mk_dropusertabs.ksh -r user/password@tns-alias SAPSR3 16 (default is the number of cores available)
#

# See: https://wiki.loopback.org/confluence/x/AgCw

CPULOG=number_cpu.log

if [ -f $CPULOG ]
  then
     rm $CPULOG
fi

TMP=$0.$$
usage() {
	echo "usage: $0 [ -r user/password@tns-alias ] <Schema-Owner (e.g. SAPSR3)> <Number of parallel threads (1 <= n <= $CPUTHREADS)>"
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

get_tablist() {
	sqlplus "$REMOTECONNECTION" << /EOF > $TMP
	spool $NAME.log
	set echo on
	set lines 140
	set trimout on
	set trimspool on
	set verify off
	column "Owner" format a30
	column "Table" format a40
	column "Bytes" format 999999999999999999
	select t.owner "Owner", t.table_name "Table", nvl(sum(s.bytes),0) "Bytes"
	from dba_tables t, dba_segments s
	where t.owner='$OWNER'
	and t.owner=s.owner (+)
	and t.table_name=s.segment_name (+)
	group by t.owner, t.table_name
	order by "Bytes" desc
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
	-*)	echo "Unknown Parameter: \"$1\""
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
[[ $THREADS -lt 1 ]] || [[ $THREADS -gt 16 ]] && THREADS=$CPUTHREADS

NAME=`basename $0 | cut -f1 -d"."`
get_tablist $OWNER

HOST=`hostname | cut -f1 -d"."`
USER=$OWNER 
SID=$ORACLE_SID
typeset -i I=0
rm ./dropusertabs_${HOST}_${SID}_${USER}.[0-9]*.sh* 2> /dev/null
while [[ $I -lt $THREADS ]]; do
	I=$I+1
	cat << /EOF > ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh
	cat << /EF | sqlplus "$REMOTECONNECTION"
	spool ./dropusertabs_${HOST}_${SID}_${USER}.$I.log
	set termout off echo off feed off trimspool on head off pages 0
	set timing on
	set linesize 200
	select * from dual;
/EOF
done

typeset -i I=0
grep "^$OWNER" $NAME.log > $TMP
while read OWN TAB BYTES; do
	###echo "$OWN $TAB $BYTES"
	I=$I+1
	[[ $I -gt $THREADS ]] && I=1
	echo "drop table $OWN.\"$TAB\";" >> ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh.tmp
done < $TMP

#echo "created $THREADS scripts:"
I=0
while [[ $I -lt $THREADS ]]; do
	I=$I+1
	typeset -i J=0
	if [ -f ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh.tmp ]; then
		cat ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh.tmp >> ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh
		J=`wc ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh.tmp | awk '{print $1}'`
		echo "./dropusertabs_${HOST}_${SID}_${USER}.$I.sh     Number of entries: $J"
		echo "/EF" >> ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh
		chmod 755 ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh
		rm ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh.tmp
	else
		rm ./dropusertabs_${HOST}_${SID}_${USER}.$I.sh
	fi
done
rm $TMP

echo "Ready."
