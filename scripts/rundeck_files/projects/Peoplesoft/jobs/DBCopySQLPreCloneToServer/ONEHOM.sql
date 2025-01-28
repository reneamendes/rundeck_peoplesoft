--****************************************
-- PARAMETROS DE INICIALIZACAO
--****************************************
exec dbms_stats.gather_dictionary_stats(estimate_percent=>100,method_opt=>'FOR ALL COLUMNS SIZE 1');

ALTER SYSTEM SET db_create_file_dest='/oradata';
ALTER SYSTEM SET db_recovery_file_dest='/oradata/fast_recovery_area';
ALTER SYSTEM SET db_recovery_file_dest_size=200G;
ALTER SYSTEM SET diagnostic_dest='/u01/app/oracle';
ALTER SYSTEM SET pga_aggregate_limit=2G;
ALTER SYSTEM SET pga_aggregate_target=2G;
ALTER SYSTEM SET processes=300;
ALTER SYSTEM SET sga_max_size=4G;
ALTER SYSTEM SET sga_target=4G;

-**************
-- PROFILE
-**************

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LOCK_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_GRACE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS UNLIMITED;

--************************************************
-- USUARIO DE IMPORTACAO DE BANCO
--************************************************

CREATE USER DTI1145159 IDENTIFIED BY oracle123;
GRANT DBA, DROP ANY TABLE, CREATE ANY TABLE, DATAPUMP_IMP_FULL_DATABASE TO DTI1145159;

--************************************************
-- USUARIOS DE CONSULTA
--************************************************

CREATE USER DTI1149524 IDENTIFIED BY DTI1149524;
CREATE USER DTI1147858 IDENTIFIED BY DTI1147858;
CREATE USER DTI1906931 IDENTIFIED BY DTI1906931 ;
CREATE USER DTI1707131 IDENTIFIED BY DTI1707131 ;

GRANT CREATE SESSION, SELECT ANY TABLE TO DTI1149524, DTI1147858, DTI1906931, DTI1707131;

--************************************************
-- TABLESPACES
--************************************************
alter system set db_create_file_dest='/oradata' SCOPE=BOTH;

CREATE TABLESPACE ONESOURCE_DATA DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TABLESPACE ONESOURCE_INDX DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

--**********************************
-- DIRECTORIES
--**********************************

CREATE DIRECTORY ORABACKUP AS '/orabackup/bkpixf/ONEHOM';
CREATE DIRECTORY EXPDP_DIR AS '/orabackup/bkpixf/ONEHOM';

--************************************************
-- DBSNMP
--************************************************
ALTER USER DBSNMP ACCOUNT UNLOCK;
ALTER USER DBSNMP IDENTIFIED BY b0tviWta;
