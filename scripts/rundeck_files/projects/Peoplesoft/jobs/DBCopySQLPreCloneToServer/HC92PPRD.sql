--****************************************
-- INITIALIZATION PARAMETERS
--****************************************
ALTER SYSTEM SET "_unnest_subquery"=false SCOPE=BOTH;
ALTER SYSTEM SET "_gby_hash_aggregation_enabled"=false SCOPE=BOTH;
alter system set db_files = 256 scope = spfile;
alter system set streams_pool_size=256M scope=both;
--exec dbms_stats.gather_dictionary_stats(estimate_percent=>100,method_opt=>'FOR ALL COLUMNS SIZE 1');

--"ORA-04036: PGA memory used by the instance exceeds PGA_AGGREGATE_LIMIT"
ALTER SYSTEM SET PGA_AGGREGATE_LIMIT=0 SCOPE=BOTH;

--**************
-- PROFILE
--**************

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LOCK_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_GRACE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;

--************************************************
-- DATABASE IMPORT USER ACCOUNT
--************************************************

CREATE USER [DBIMPUSER] IDENTIFIED BY [yourpassword];
GRANT DBA, DROP ANY TABLE, CREATE ANY TABLE, DATAPUMP_IMP_FULL_DATABASE TO [DBIMPUSER];

--************************************************
-- TABLESPACES
--************************************************
alter system set db_create_file_dest='/oradata' SCOPE=BOTH;

CREATE TABLESPACE PTTLRG DATAFILE SIZE 256M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE AAAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE AALARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE ADAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE AMAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE AVAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE BDAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE BNAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE BNLARGE DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;

CREATE TABLESPACE CCAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE COAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CUAUDIT DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARG1 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARG2 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARG3 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE DIAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE DTAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;

CREATE TABLESPACE EOBFAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCFAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE EOCMAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCMLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCMWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCUAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCULRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EODSAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EODSLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOECAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;

CREATE TABLESPACE EOECLRG DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE EOECWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEIAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEILRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEWAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEWLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEWWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOIUAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOIULRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOIUWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOLTAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;

CREATE TABLESPACE EOPPAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOPPLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOTPAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOTPLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EPAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE EPLARGE DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE ERAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE ERLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE ERWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FAAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE FALARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;

CREATE TABLESPACE FGLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FSAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE GIAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE GPAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TABLESPACE GPDEAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HPAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP1 DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP2 DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP3 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP4 DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP5 DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP6 DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

CREATE TABLESPACE HRAPP7 DATAFILE SIZE 1024M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE HRIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HRLARG1 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HRLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE HRSAPP DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE HRSARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HRSLARGE DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE HRSWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HRWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HTAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE INAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE POLARGE DATAFILE SIZE 512M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

CREATE TABLESPACE PAAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE PALARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PCAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PCLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PIAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PILARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PIWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE POAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PSDEFAULT DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE PSIMAGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE PSIMAGE2 DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TABLESPACE PSIMGR DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PSINDEX DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TABLESPACE PSINDEX2 DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

CREATE TABLESPACE PSMATVW DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE PSWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTAMSG DATAFILE SIZE 2048M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;
CREATE TABLESPACE PTAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE PTAPPE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTAUDIT DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTCMSTAR DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTLOCK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTPRC DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE PTPRJWK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTRPTS DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE PTTBL DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE PTTREE DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

CREATE TABLESPACE PTWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PVAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PY0LRG DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE PYAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE PYLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PYWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE SAAPP DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE SACAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE SALARGE DATAFILE SIZE 512M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE SRAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE STAPP DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE STLARGE DATAFILE SIZE 64M AUTOEXTEND ON NEXT 64M MAXSIZE 32767M;
CREATE TABLESPACE STWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;

CREATE TABLESPACE TLAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE TLLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE TLWORK DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE WAAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TEMPORARY TABLESPACE PSGTT01 tempfile SIZE 4096M AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TEMPORARY TABLESPACE PSTEMP tempfile SIZE 4096M AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;

--************************************************
-- SYSADM
--************************************************
CREATE ROLE PSADMIN;
GRANT
CREATE SESSION,
CREATE  TABLE,
CREATE  PROCEDURE,
CREATE  SYNONYM,
CREATE  VIEW,
CREATE  TRIGGER,
ADMINISTER DATABASE TRIGGER,
CREATE DATABASE LINK,
CREATE MATERIALIZED VIEW
TO PSADMIN ;

EXEC DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE (GRANTEE_NAME => 'PSADMIN', PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',ADMIN_OPTION => TRUE);

GRANT SELECT ON V_$MYSTAT to PSADMIN;
GRANT SELECT ON  USER_AUDIT_POLICIES to PSADMIN;
GRANT SELECT ON FGACOL$  to PSADMIN;
GRANT EXECUTE ON DBMS_FGA to PSADMIN;

DECLARE
   Vdollarversion VARCHAR2(17);
BEGIN
    SELECT version 
    into  Vdollarversion
    FROM v$instance;
    DBMS_OUTPUT.PUT_LINE('Oracle Version: '|| Vdollarversion);
    IF Vdollarversion >= '12.1.0.2.0'
    THEN 
    DBMS_OUTPUT.PUT_LINE('EXEC 12c IMDB specific GRANTS');
    EXECUTE IMMEDIATE ('GRANT SELECT ON v_$im_column_level to PSADMIN');
    EXECUTE IMMEDIATE ('GRANT SELECT ON v_$im_user_segments to PSADMIN');
    ELSE
    DBMS_OUTPUT.PUT_LINE('IMDB grants not executed. IMDB feature is not available in this Oracle version.');
    END IF;   
END;
/

grant execute on DBMS_METADATA to PSADMIN;
grant execute on DBMS_MVIEW to PSADMIN;
grant execute on DBMS_SESSION to PSADMIN;
grant execute on DBMS_STATS to PSADMIN;
grant execute on DBMS_XMLGEN to PSADMIN;
grant execute on DBMS_APPLICATION_INFO to PSADMIN;
grant execute on dbms_refresh to PSADMIN;
grant execute on dbms_job to PSADMIN;
grant execute on dbms_lob to PSADMIN;
grant execute on DBMS_OUTPUT to PSADMIN;
GRANT CREATE MATERIALIZED VIEW TO PSADMIN;


create user SYSADM IDENTIFIED BY [YOURPASSWORD] default tablespace PSDEFAULT
temporary tablespace pstemp;
grant PSADMIN TO SYSADM;
grant unlimited tablespace to SYSADM;

alter user sysadm identified by F3GMN3NS;

GRANT SELECT_CATALOG_ROLE to SYSADM;
GRANT EXECUTE_CATALOG_ROLE to SYSADM;

--drop user sysadm cascade;

CREATE ROLE PSUSER;

--**********************************
-- DIRECTORIES
--**********************************

CREATE DIRECTORY ORABACKUP AS '/HC92PPRD';
CREATE DIRECTORY EXPDP_DIR AS '/HC92PPRD';

--DROP USER SYSADM CASCADE;

GRANT SELECT ON V_$MYSTAT to PSADMIN;
GRANT SELECT ON  USER_AUDIT_POLICIES to PSADMIN;
GRANT SELECT ON FGACOL$  to PSADMIN;
GRANT EXECUTE ON DBMS_FGA to PSADMIN;

--************************************************
-- PS
--************************************************

CREATE USER PS IDENTIFIED BY PS QUOTA UNLIMITED ON PSDEFAULT;
CREATE TABLE PS.PSDBOWNER (DBNAME VARCHAR2(8) NOT NULL, OWNERID VARCHAR2(8) NOT NULL ) TABLESPACE PSDEFAULT;
CREATE UNIQUE INDEX PS.PS_PSDBOWNER ON PS.PSDBOWNER (DBNAME) TABLESPACE PSDEFAULT;
CREATE PUBLIC SYNONYM PSDBOWNER FOR PS.PSDBOWNER;
INSERT INTO PS.PSDBOWNER  VALUES ('HC92PPRD','SYSADM');
commit;
grant select,insert,update,delete on PS.PSDBOWNER  to PSADMIN;

--************************************************
-- PEOPLE
--************************************************
--DROP USER PEOPLE;
create USER PEOPLE identified by peop1e default tablespace PSDEFAULT temporary tablespace PSTEMP;

GRANT CREATE SESSION to PEOPLE;
GRANT SELECT ON PSDBOWNER TO PEOPLE;

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LOCK_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_GRACE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;


--ALTER TABLESPACE PSINDEX ADD DATAFILE SIZE 8G AUTOEXTEND ON NEXT 512M MAXSIZE UNLIMITED;
--ALTER TABLESPACE GPAPP ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;
--ALTER TABLESPACE PSINDEX ADD DATAFILE SIZE 20G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;
--ALTER TABLESPACE PSTEMP ADD TEMPFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;


