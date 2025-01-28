--****************************************
-- PARAMETROS DE INICIALIZACAO
--****************************************
ALTER SYSTEM SET "_unnest_subquery"=false SCOPE=BOTH;
ALTER SYSTEM SET "_gby_hash_aggregation_enabled"=false SCOPE=BOTH;
alter system set pga_aggregate_limit=0 scope=both;
alter system set db_files = 256 scope = spfile;
alter system set streams_pool_size=256M scope=both;
--exec dbms_stats.gather_dictionary_stats(estimate_percent=>100,method_opt=>'FOR ALL COLUMNS SIZE 1');

--************************************************
-- USUARIO DE IMPORTACAO DE BANCO
--************************************************

CREATE USER DTI1145159 IDENTIFIED BY oracle123;
GRANT DBA, DROP ANY TABLE, CREATE ANY TABLE, DATAPUMP_IMP_FULL_DATABASE TO DTI1145159;

--************************************************
-- USUARIOS DE CONSULTA
--************************************************

CREATE USER DTI1149524 IDENTIFIED BY DTI1149524;
CREATE USER DTI1141992 IDENTIFIED BY DTI1141992;
CREATE USER DTI1707131 IDENTIFIED BY DTI1707131;
CREATE USER DTI1116481 IDENTIFIED BY DTI1116481;
CREATE USER DTI1149680 IDENTIFIED BY DTI1149680;
CREATE USER DTI1147858 IDENTIFIED BY DTI1147858;

GRANT CREATE SESSION, SELECT ANY TABLE, DELETE ANY TABLE, UPDATE ANY TABLE, INSERT ANY TABLE TO DTI1141992,DTI1149524,DTI1707131,DTI1116481,DTI1149680,DTI1147858;

--************************************************
-- TABLESPACES
--************************************************
alter system set db_create_file_dest='/oradata' SCOPE=BOTH;

CREATE TEMPORARY TABLESPACE PSTEMP tempfile SIZE 8192M AUTOEXTEND ON NEXT 8192M MAXSIZE 32767M;

CREATE TABLESPACE AMARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE APARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE ARARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE AUCLRGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE BCAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE BDLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CFGAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CPAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CPLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CSLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CSWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CUAUDIT DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARG1 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARG2 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARG3 DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE CULARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE DIAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE DPWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOBFAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCMLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCMWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOCUAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EODSAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EODSLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOECWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEILRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEPLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEWAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEWLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOEWWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOIULRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOIUWRK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOLTAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOPPAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOPPLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOTPAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EOTPLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE EXARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FALARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FAWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGTEMP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FGWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FIAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FILARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FOIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE FOWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE GLARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE HTAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE INARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE LCLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE MPLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE MPWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE NFLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE OEAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PBAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PBIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PBLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PBWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PCARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PCWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PIPSAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PIPSLRG DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PIPSWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PLWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PSIMGR DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PSMATVW DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PSWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTCMSTAR DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTLOCK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTPRJWK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTTREE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PTWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PVLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE PYAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE RBAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE RBTEMP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE REIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE ROAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE RSFAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE RSWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE SACAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE SACLRGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE SPLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TDAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TDLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TDWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TLAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TLWORK DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TPMAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TRARCH DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE TRIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE WMIMAGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE WSAPP DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;
CREATE TABLESPACE WSLARGE DATAFILE SIZE 8M AUTOEXTEND ON NEXT 8M MAXSIZE 32767M;

CREATE TABLESPACE APWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE TRLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE POWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE INWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE INAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE ARWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE BIAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE AMWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE BIWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE ARAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE SPAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PCAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE NFAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE MGAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE LCAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE GMAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EXWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOECAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOCULRG DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE CAWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOIUAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE CAAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE REWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE FAAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE FOAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE FOLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE FSAPP1 DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE RSAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE HRAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE WMLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EXAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PTAUDIT DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE TRWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE RSLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE BDAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE MPAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE AUCAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE WMWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PCLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PGMAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PGMLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PGMWORK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PLAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PLLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE WMAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PTAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE PTAPPE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOEPWRK DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOEPAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOEIAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE RELARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE REAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOCMAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE EOCFAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE DPLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE DPAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE CSAPP DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE MGLARGE DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;
CREATE TABLESPACE INTRANETMACK_DATA DATAFILE SIZE 32M AUTOEXTEND ON NEXT 32M MAXSIZE 32767M;

CREATE TABLESPACE EOECLRG DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE OMWORK DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE OMAPP DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE TRAPP DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE PTPRC DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE PVAPP DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE EXLARGE DATAFILE SIZE 128M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

CREATE TABLESPACE ARLARGE DATAFILE SIZE 512M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE HRLARGE DATAFILE SIZE 512M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;
CREATE TABLESPACE PTRPTS DATAFILE SIZE 512M AUTOEXTEND ON NEXT 128M MAXSIZE 32767M;

CREATE TABLESPACE POAPP DATAFILE SIZE 1024M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;
CREATE TABLESPACE PTAMSG DATAFILE SIZE 1024M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;
CREATE TABLESPACE PTTLRG DATAFILE SIZE 1024M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;
CREATE TABLESPACE FSWORK DATAFILE SIZE 1024M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;

CREATE TABLESPACE APLARGE DATAFILE SIZE 2048M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;
CREATE TABLESPACE PTTBL DATAFILE SIZE 2048M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;
CREATE TABLESPACE OMLARGE DATAFILE SIZE 2048M AUTOEXTEND ON NEXT 512M MAXSIZE 32767M;

CREATE TABLESPACE PSDEFAULT DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE PSIMAGE2 DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE POLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE GLLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE FSLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE GLAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE AMLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE FSAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE AMAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE INLARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE BILARGE DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE APAPP DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;
CREATE TABLESPACE GLWORK DATAFILE SIZE 4096M AUTOEXTEND ON NEXT 2048M MAXSIZE 32767M;

CREATE TABLESPACE PSINDEX DATAFILE SIZE 24G AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;
CREATE TABLESPACE PSIMAGE DATAFILE SIZE 24G AUTOEXTEND ON NEXT 4096M MAXSIZE 32767M;

-- I M P O R T A N T E : COMENTAR APOS A EXECUCAO
--ALTER TABLESPACE PSINDEX ADD DATAFILE SIZE 24G AUTOEXTEND ON NEXT 8192M MAXSIZE UNLIMITED;
--ALTER TABLESPACE PSINDEX ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 2G MAXSIZE UNLIMITED;

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

CREATE DIRECTORY ORABACKUP AS '/orabackup/bkpixf/FS91MHOM';
CREATE DIRECTORY EXPDP_DIR AS '/orabackup/bkpixf/FS91MHOM';

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
INSERT INTO PS.PSDBOWNER  VALUES ('FS91MHOM','SYSADM');
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


ALTER TABLESPACE PSINDEX ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;
ALTER TABLESPACE PSIMAGE ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;
ALTER TABLESPACE PSIMAGE2 ADD DATAFILE SIZE 2G AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;

GRANT READ, WRITE ON DIRECTORY INTEGRACAO_CR TO SYSADM;

CREATE TABLE "SYSADM"."PS_PV_ATT_DB_SRV" (
    "ATTACHSYSFILENAME"   VARCHAR2(128 BYTE)
        NOT NULL ENABLE,
    "FILE_SEQ"            NUMBER(*,0)
        NOT NULL ENABLE,
    "VERSION"             NUMBER(*,0)
        NOT NULL ENABLE,
    "FILE_SIZE"           NUMBER(10,0)
        NOT NULL ENABLE,
    "LASTUPDDTTM"         TIMESTAMP(6),
    "LASTUPDOPRID"        VARCHAR2(30 BYTE)
        NOT NULL ENABLE,
    "FILE_DATA"           BLOB
)
    SEGMENT CREATION IMMEDIATE
        PCTFREE 10 PCTUSED 80 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
            STORAGE ( INITIAL 40960 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT
CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "PSIMAGE"
    LOB ( "FILE_DATA" ) STORE AS BASICFILE (
        TABLESPACE "PSIMAGE"
        ENABLE STORAGE IN ROW
        CHUNK 8192
        RETENTION
        NOCACHE LOGGING
        STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT
CELL_FLASH_CACHE DEFAULT )
    );

CREATE UNIQUE INDEX "SYSADM"."PS_PV_ATT_DB_SRV" ON
    "SYSADM"."PS_PV_ATT_DB_SRV" (
        "ATTACHSYSFILENAME",
        "FILE_SEQ",
        "VERSION"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 40960 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT
CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "PSINDEX";


--************************************************
-- DBSNMP
--************************************************
ALTER USER DBSNMP ACCOUNT UNLOCK;
ALTER USER DBSNMP IDENTIFIED BY b0tviWta;

GRANT SELECT ON sys.dba_tables TO SYSADM;
GRANT SELECT ON sys.dba_tab_cols TO SYSADM;
GRANT SELECT ON sys.dba_tab_statistics TO SYSADM;
GRANT SELECT ON sys.dba_external_tables TO SYSADM;
GRANT SELECT ON sys.dba_indexes TO SYSADM;
GRANT SELECT ON sys.dba_scheduler_jobs TO SYSADM;
GRANT SELECT ON sys.dba_autotask_client TO SYSADM;
GRANT SELECT ON sys.v_$instance TO SYSADM;
GRANT SELECT ON sys.v_$parameter2 TO SYSADM;

ALTER PACKAGE SYSADM.PSCBO_STATS COMPILE BODY;