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

-- PARAMETRO NECESSARIO PARA EVITAR DE A CRIACAO DOS INDICES PARAR PELO ERRO "ORA-04036: PGA memory used by the instance exceeds PGA_AGGREGATE_LIMIT"
ALTER SYSTEM SET PGA_AGGREGATE_LIMIT=0 SCOPE=BOTH;


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
-- TABLESPACES
--************************************************
alter system set db_create_file_dest='/oradata' SCOPE=BOTH;

CREATE TABLESPACE MCK_DATA DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PERGAINDEX DATAFILE SIZE 24G AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TABLESPACE PERGAMARC DATAFILE SIZE 24G AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;

--**********************************
-- DIRECTORIES
--**********************************

CREATE DIRECTORY ORABACKUP AS '/orabackup/bkpixf/PERGTST';
CREATE DIRECTORY EXPDP_DIR AS '/orabackup/bkpixf/PERGTST';

--************************************************
-- DBSNMP
--************************************************
ALTER USER DBSNMP ACCOUNT UNLOCK;
ALTER USER DBSNMP IDENTIFIED BY b0tviWta;
