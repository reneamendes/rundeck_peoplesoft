--****************************************
-- PARAMETROS DE INICIALIZACAO
--****************************************
ALTER SYSTEM SET "_unnest_subquery"=false SCOPE=BOTH;
ALTER SYSTEM SET "_gby_hash_aggregation_enabled"=false SCOPE=BOTH;
ALTER SYSTEM SET "_optimizer_skip_scan_enabled"=false SCOPE=BOTH;
ALTER SYSTEM SET "_fix_control"='14033181:0' SCOPE=BOTH;
ALTER SYSTEM SET "_disable_function_based_index"=TRUE SCOPE=BOTH;
ALTER SYSTEM SET "_disable_streams_pool_auto_tuning"=TRUE SCOPE=BOTH;
ALTER SYSTEM SET "_ignore_desc_in_index"=TRUE SCOPE=BOTH;
ALTER SYSTEM SET "_optimizer_cost_based_transformation"='ON' SCOPE=BOTH;
ALTER SYSTEM SET "_spin_count"=2000 SCOPE=BOTH;
ALTER SYSTEM SET "_unnest_subquery"=FALSE SCOPE=BOTH;
ALTER SYSTEM SET optimizer_adaptive_features=FALSE SCOPE=BOTH;
alter system set db_files = 256 scope = spfile;
alter system set streams_pool_size=256M scope=both;
exec dbms_stats.gather_dictionary_stats(estimate_percent=>100,method_opt=>'FOR ALL COLUMNS SIZE 1');

--************************************************
-- USUARIO DE IMPORTACAO DE BANCO
--************************************************

CREATE USER DTI1145159 IDENTIFIED BY oracle123;
GRANT DBA, DROP ANY TABLE, CREATE ANY TABLE, DATAPUMP_IMP_FULL_DATABASE TO DTI1145159;

--************************************************
-- USUARIOS DE CONSULTA
--************************************************

CREATE USER DTI1149524 IDENTIFIED BY DTI1149524;
CREATE USER DTI1707131 IDENTIFIED BY DTI1707131;
CREATE USER DTI1116481 IDENTIFIED BY DTI1116481;
CREATE USER DTI1149680 IDENTIFIED BY DTI1149680;
CREATE USER DTI1147858 IDENTIFIED BY DTI1147858;

GRANT CREATE SESSION, SELECT ANY TABLE, DELETE ANY TABLE, UPDATE ANY TABLE, INSERT ANY TABLE TO DTI1149524,DTI1707131,DTI1116481,DTI1149680,DTI1147858;

--************************************************
-- TABLESPACES
--************************************************
alter system set db_create_file_dest='/oradata' SCOPE=BOTH;


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


create user SYSADM identified by SYSADM default tablespace PSDEFAULT
temporary tablespace pstemp;
grant PSADMIN TO SYSADM;
grant unlimited tablespace to SYSADM;

alter user sysadm identified by V7TQP8TQ;

GRANT SELECT_CATALOG_ROLE to SYSADM;
GRANT EXECUTE_CATALOG_ROLE to SYSADM;

--drop user sysadm cascade;

CREATE ROLE PSUSER;

--**********************************
-- DIRECTORIES
--**********************************

CREATE DIRECTORY ORABACKUP AS '/orabackup/bkpixf/FS91MBDL';
CREATE DIRECTORY EXPDP_DIR AS '/orabackup/bkpixf/FS91MBDL';

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
INSERT INTO PS.PSDBOWNER  VALUES ('FS91MBDL','SYSADM');

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


ALTER TABLESPACE PSINDEX ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;
ALTER TABLESPACE PSIMAGE ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;

--************************************************
-- DBSNMP
--************************************************
ALTER USER DBSNMP ACCOUNT UNLOCK;
ALTER USER DBSNMP IDENTIFIED BY b0tviWta;
