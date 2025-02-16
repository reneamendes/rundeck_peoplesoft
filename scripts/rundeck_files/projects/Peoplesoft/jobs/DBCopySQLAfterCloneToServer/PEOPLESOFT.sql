ALTER SESSION SET CURRENT_SCHEMA=SYSADM;

-- ***************************
-- PS_PURGEMESSAGEALL
-- ***************************
TRUNCATE TABLE SYSADM.PSIBRELMSGSEQ;
TRUNCATE TABLE SYSADM.PSIBRELMSGHDR;
TRUNCATE TABLE SYSADM.PSIBRELMSGDATA;
TRUNCATE TABLE SYSADM.PSIBPROFILESYNC;
TRUNCATE TABLE SYSADM.PSIBPROFILESUB;
TRUNCATE TABLE SYSADM.PSIBPROFILEPUB;
TRUNCATE TABLE SYSADM.PSIBPROFILEBRK;
TRUNCATE TABLE SYSADM.PSIBLOGIBINFOAR;
TRUNCATE TABLE SYSADM.PSIBLOGIBINFO;
TRUNCATE TABLE SYSADM.PSIBLOGHDRARCH;
TRUNCATE TABLE SYSADM.PSIBLOGHDR;
TRUNCATE TABLE SYSADM.PSIBLOGERRP;
TRUNCATE TABLE SYSADM.PSIBLOGERR;
TRUNCATE TABLE SYSADM.PSIBLOGDATAARCH;
TRUNCATE TABLE SYSADM.PSIBLOGDATA;
TRUNCATE TABLE SYSADM.PSIBFCLOCK;
TRUNCATE TABLE SYSADM.PSIBERRP;
TRUNCATE TABLE SYSADM.PSIBERR;
TRUNCATE TABLE SYSADM.PSIBDEBUGLOG;
TRUNCATE TABLE SYSADM.PSIBAEATTR;
TRUNCATE TABLE SYSADM.PSIBADSLOCK;
TRUNCATE TABLE SYSADM.PSAPMSGSUBCON;
TRUNCATE TABLE SYSADM.PSAPMSGSUBCERRP;
TRUNCATE TABLE SYSADM.PSAPMSGSUBCERR;
TRUNCATE TABLE SYSADM.PSAPMSGSCONDATA;
TRUNCATE TABLE SYSADM.PSAPMSGPUBHDR;
TRUNCATE TABLE SYSADM.PSAPMSGPUBERRP;
TRUNCATE TABLE SYSADM.PSAPMSGPUBERR;
TRUNCATE TABLE SYSADM.PSAPMSGPUBDATA;
TRUNCATE TABLE SYSADM.PSAPMSGPUBCON;
TRUNCATE TABLE SYSADM.PSAPMSGPUBCERRP;
TRUNCATE TABLE SYSADM.PSAPMSGPUBCERR;
TRUNCATE TABLE SYSADM.PSAPMSGPCONDATA;
TRUNCATE TABLE SYSADM.PSAPMSGIBATTR;
TRUNCATE TABLE SYSADM.PSAPMSGDSPSTAT;
TRUNCATE TABLE SYSADM.PSAPMSGDOMSTAT;
TRUNCATE TABLE SYSADM.PSAPMSGARCHST;
TRUNCATE TABLE SYSADM.PSAPMSGARCHSC;
TRUNCATE TABLE SYSADM.PSAPMSGARCHPT;
TRUNCATE TABLE SYSADM.PSAPMSGARCHPH;
TRUNCATE TABLE SYSADM.PSAPMSGARCHPD;
TRUNCATE TABLE SYSADM.PSAPMSGARCHPC;

ALTER TABLE SYSADM.PSIBRELMSGSEQ MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBRELMSGHDR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBRELMSGDATA MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSIBPROFILESYNC MOVE TABLESPACE PTTBL;
ALTER TABLE SYSADM.PSIBPROFILESUB MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBPROFILEPUB MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBPROFILEBRK MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBLOGIBINFOAR MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSIBLOGIBINFO MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSIBLOGHDRARCH MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBLOGHDR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBLOGERRP MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBLOGERR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBLOGDATAARCH MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSIBLOGDATA MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSIBFCLOCK MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBERRP MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBERR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBDEBUGLOG MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBAEATTR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSIBADSLOCK MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGSUBCON MOVE TABLESPACE PTTBL;
ALTER TABLE SYSADM.PSAPMSGSUBCERRP MOVE TABLESPACE PTTBL;
ALTER TABLE SYSADM.PSAPMSGSUBCERR MOVE TABLESPACE PTTBL;
ALTER TABLE SYSADM.PSAPMSGSCONDATA MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSAPMSGPUBHDR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGPUBERRP MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGPUBERR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGPUBDATA MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSAPMSGPUBCON MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGPUBCERRP MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGPUBCERR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGPCONDATA MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSAPMSGIBATTR MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGDSPSTAT MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGDOMSTAT MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGARCHST MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSAPMSGARCHSC MOVE TABLESPACE PTTBL;
ALTER TABLE SYSADM.PSAPMSGARCHPT MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSAPMSGARCHPH MOVE TABLESPACE PTAMSG;
ALTER TABLE SYSADM.PSAPMSGARCHPD MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PSAPMSGARCHPC MOVE TABLESPACE PTAMSG;

ALTER INDEX SYSADM.PS_PSAPMSGARCHPC REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGARCHPD REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGARCHPH REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGARCHPT REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGARCHSC REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGARCHST REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGDOMSTAT REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGDSPSTAT REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGIBATTR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPCONDATA REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBCERR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBCERRP REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSAPSAPMSGPUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSBPSAPMSGPUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSCPSAPMSGPUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSDPSAPMSGPUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBDATA REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBERR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBERRP REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGPUBHDR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSAPSAPMSGPUBHDR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSBPSAPMSGPUBHDR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSCPSAPMSGPUBHDR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGSCONDATA REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGSUBCERR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGSUBCERRP REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSAPMSGSUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSAPSAPMSGSUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSBPSAPMSGSUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSCPSAPMSGSUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSDPSAPMSGSUBCON REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBADSLOCK REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBAEATTR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBDEBUGLOG REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBERR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBERRP REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBFCLOCK REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGDATA REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGDATAARCH REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGERR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGERRP REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGHDR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGHDRARCH REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGIBINFO REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBLOGIBINFOAR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBPROFILEBRK REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBPROFILEPUB REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBPROFILESUB REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBPROFILESYNC REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBRELMSGDATA REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBRELMSGHDR REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_PSIBRELMSGSEQ REBUILD TABLESPACE PSINDEX;

-- ***************************
-- PS_PURGEREPORT
-- ***************************
TRUNCATE TABLE SYSADM.PS_CDM_TRNFR_RJCT;
TRUNCATE TABLE SYSADM.PS_CDM_TRANSFER;
TRUNCATE TABLE SYSADM.PS_CDM_TEXT;
TRUNCATE TABLE SYSADM.PS_CDM_LIST_ARCH;
TRUNCATE TABLE SYSADM.PS_CDM_LIST;
TRUNCATE TABLE SYSADM.PS_CDM_FILE_LIST;
TRUNCATE TABLE SYSADM.PS_CDM_AUTH;

ALTER TABLE SYSADM.PS_CDM_TRNFR_RJCT MOVE TABLESPACE PTRPTS;
ALTER TABLE SYSADM.PS_CDM_TRANSFER MOVE TABLESPACE PTRPTS;
ALTER TABLE SYSADM.PS_CDM_TEXT MOVE TABLESPACE PSIMAGE2;
ALTER TABLE SYSADM.PS_CDM_LIST_ARCH MOVE TABLESPACE PTRPTS;
ALTER TABLE SYSADM.PS_CDM_LIST MOVE TABLESPACE PTRPTS;
ALTER TABLE SYSADM.PS_CDM_FILE_LIST MOVE TABLESPACE PTRPTS;
ALTER TABLE SYSADM.PS_CDM_AUTH MOVE TABLESPACE PTRPTS;

ALTER INDEX SYSADM.PSACDM_AUTH REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_AUTH REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_FILE_LIST REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_LIST REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PSACDM_LIST REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_LIST_ARCH REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_TEXT REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_TRANSFER REBUILD TABLESPACE PSINDEX;
ALTER INDEX SYSADM.PS_CDM_TRNFR_RJCT REBUILD TABLESPACE PSINDEX;

-- ***************************
-- PS_PURGEPROCESSSCHEDULER
-- ***************************
TRUNCATE TABLE SYSADM.PS_PRCSRQSTNOTIFY;
TRUNCATE TABLE SYSADM.PS_PRCSRQSTDIST;
TRUNCATE TABLE SYSADM.PS_MESSAGE_LOGPARM;
TRUNCATE TABLE SYSADM.PS_MESSAGE_LOG;
TRUNCATE TABLE SYSADM.PSPRCSRQSTXFER;
TRUNCATE TABLE SYSADM.PSPRCSRQSTTIME;
TRUNCATE TABLE SYSADM.PSPRCSRQSTTEXT;
TRUNCATE TABLE SYSADM.PSPRCSRQSTSTRNG;
TRUNCATE TABLE SYSADM.PSPRCSRQSTMETA;
TRUNCATE TABLE SYSADM.PSPRCSRQSTFILE;
TRUNCATE TABLE SYSADM.PSPRCSRQST;
TRUNCATE TABLE SYSADM.PSPRCSQUE;
TRUNCATE TABLE SYSADM.PSPRCSPARMS;
TRUNCATE TABLE SYSADM.PSPRCSCHLDINFO;

-- ***************************
-- HCM PURGE NOTIFICATION
-- ***************************
DELETE FROM SYSADM.PSROLEUSER_VW 
WHERE OPRID NOT IN ('PS')
AND ROLENAME IN ('MIS Administrator','VC Administrator');

-- ***************************
-- PS DELETE PROCESS SERVER
-- ***************************
DELETE FROM PSSERVERSTAT WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERCLASS WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERDEFN_LNG WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVEROPRTN WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERDEFN WHERE SERVERNAME NOT IN ('PSNT','PSUNX'); 
DELETE FROM PS_SERVERACTVTY WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERMESSAGE WHERE SERVERNAME  NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERNOTIFY WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERPURGLIST WHERE SERVERNAME NOT IN ('PSNT','PSUNX');
DELETE FROM PSPRCSQUE WHERE SERVERNAMERQST NOT IN ('PSNT','PSUNX') OR SERVERNAMERUN NOT IN ('PSNT','PSUNX') OR SERVERASSIGN NOT IN ('PSNT','PSUNX');
DELETE FROM PS_CDM_TRANSFER WHERE SERVERNAMERUN NOT IN ('PSNT','PSUNX');
DELETE FROM PS_SERVERCATEGORY WHERE SERVERNAME  NOT IN ('PSNT','PSUNX');

UPDATE PSPRCSRQST SET SERVERNAMERQST = 'PSUNX';


COMMIT;

-- ***************************
-- PS_CORRIGE_URL
-- ***************************
UPDATE SYSADM.PSURLDEFN
SET  URL =   REPLACE(URL, LOWER('<PROD_ENVIRONMENT>'),LOWER('<DEV_ENVIRONMENT>'));

UPDATE SYSADM.PSURLDEFN
SET  URL =   REPLACE(URL, LOWER('<PROD_HTTP_PORT>'),LOWER('<DEV_HTTP_PORT>'));

UPDATE SYSADM.PSURLDEFNLANG
SET  URL =   REPLACE(URL, LOWER('<PROD_ENVIRONMENT>'),LOWER('<DEV_ENVIRONMENT>'));

UPDATE SYSADM.PSURLDEFNLANG
SET  URL =   REPLACE(URL, LOWER('<PROD_HTTP_PORT>'),LOWER('<DEV_HTTP_PORT>'));

UPDATE SYSADM.PS_RUN_CNTL_PUR
SET  URL =   REPLACE(URL, LOWER('<PROD_HTTP_PORT>'),LOWER('<DEV_HTTP_PORT>'));

UPDATE SYSADM.PS_PO_AW 
SET  COMMENTS =   REPLACE(COMMENTS, LOWER('<PROD_ENVIRONMENT>'),LOWER('<DEV_ENVIRONMENT>'))
WHERE COMMENTS LIKE '%Exibir Histórico%';

UPDATE SYSADM.PS_PO_AW 
SET  COMMENTS =   REPLACE(COMMENTS, LOWER('<PROD_HTTP_PORT>'),LOWER('<DEV_HTTP_PORT>'))
WHERE COMMENTS LIKE '%Exibir Histórico%';

DELETE FROM SYSADM.PS_PO_AW 
WHERE EOAWDTTM_MODIFIED < SYSDATE -30;

COMMIT;

-- ***************************
-- PROCESS SCHEDULER TABLES
-- ***************************

UPDATE SYSADM.PSPRCSRQSTFILE
SET PRCSRQSTFILE = REPLACE(PRCSRQSTFILE , LOWER('<PROD_ENVIRONMENT>'),LOWER('<DEV_ENVIRONMENT>'));

UPDATE SYSADM.PSPRCSRQSTFILE
SET PRCSRQSTFILE = REPLACE(PRCSRQSTFILE , '<PROD_ENVIRONMENT>','<DEV_ENVIRONMENT>');


UPDATE SYSADM.PSPRCSPARMS
SET PRCSOUTPUTDIR = REPLACE(PRCSOUTPUTDIR , LOWER('<PROD_ENVIRONMENT>'),LOWER('<DEV_ENVIRONMENT>'));

UPDATE SYSADM.PSPRCSPARMS
SET PRCSOUTPUTDIR = REPLACE(PRCSOUTPUTDIR , '<PROD_ENVIRONMENT>','<DEV_ENVIRONMENT>');

UPDATE SYSADM.PS_PRCSDEFN
SET SERVERNAME =' ';


COMMIT;

-- ***************************
-- CHANGE EMAILS
-- ***************************

UPDATE SYSADM.PS_ROLEXLATOPR
SET EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_CONTACT
SET EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_EMAIL_ADDRESSES
SET     EMAIL_ADDR = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_CUST_CONTACT
SET EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PSUSEREMAIL
SET     EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PSOPRDEFN
SET     EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_HRS_APP_EMAIL
SET     EMAIL_ADDR = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_EMAIL_ADDRESSES
SET     EMAIL_ADDR = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_VENDOR_ADDR
SET     EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_VENDOR_CNTCT
SET     EMAILID = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_CONTACT
SET     EMAILID = 'peoplesoft@yourcompany.com';

DROP TRIGGER SYSADM.TRG_AUDIT_CUSTOMER;

UPDATE SYSADM.PS_CUSTOMER
SET     EMAIL_TO_BBL = 'peoplesoft@yourcompany.com';

UPDATE SYSADM.PS_CUSTOMER
SET     EMAIL_CC_BBL = 'peoplesoft@yourcompany.com';

COMMIT;


-- ***************************
-- HCM ANOTHER CORRECTIONS
-- ***************************

UPDATE SYSADM.PS_TL_INSTALLATION SET FILE_OUTPUT_DIR='C:\temp\', FILE_ARCHIVE_DIR='C:\temp\Saida\';

update SYSADM.PS_EO_FLOINDEFN set FILE_INBOUND = 'C:\temp\Saida\PUNCHED_TIME*.csv' WHERE FILE_ID = 'PUNCHED_TIME';

TRUNCATE TABLE SYSADM.PS_HRS_ATTACHMENTS;

-- ***************************
-- EMPOWER USERS
-- ***************************

INSERT INTO SYSADM.PSROLEUSER
SELECT '[LESS_POWERED_USERID]', ROLENAME, 'N'
FROM SYSADM.PSROLEUSER
WHERE ROLEUSER = '[MORE_POWERED_USERID]'
AND ROLENAME NOT IN
(SELECT ROLENAME
FROM SYSADM.PSROLEUSER
WHERE ROLEUSER = '[LESS_POWERED_USERID]');

--******************************
--IB ADJUSTMENT
--******************************

UPDATE SYSADM.PSIBFAILOVER
SET IB_FAILOVER_FLAG=0, IB_SLAVEMODE=0;

DELETE FROM SYSADM.PSAPMSGDOMSTAT;

INSERT INTO SYSADM.PSAPMSGDOMSTAT (MACHINENAME,APPSERVER_PATH,DOMAIN_STATUS,IBFAILOVERPRIORITY,IBFAILOVERGROUP,IB_SLAVEMODE,IB_LOADBALANCE,IB_SERVERURL,IB_DOMAIN_POOLING) 
VALUES ('<DEV_DBAPPSERVER>','/APP/psft/<DEV_SITE_NAME>/appserv/<DEV_ENVIRONMENT>','A',0,0,0,1,' ',0);

DELETE FROM SYSADM.PSIBDSPSTATVW;

INSERT INTO SYSADM.PSIBDSPSTATVW (MACHINENAME,DISPATCHERNAME,APPSERVER_PATH,DSPSTATUS,STATUSSTRING,DSPRESET,IB_SLAVEMODE,CLEANUP_DTTM) VALUES 
('<DEV_DBAPPSERVER>','PSSUBDSP_dflt','/APP/psft/<DEV_SITE_NAME>/appserv/<DEV_ENVIRONMENT>',0,'ACT',0,0,NULL), 
('<DEV_DBAPPSERVER>','PSPUBDSP_dflt','/APP/psft/<DEV_SITE_NAME>/appserv/<DEV_ENVIRONMENT>',0,'ACT',0,0,NULL), 
('<DEV_DBAPPSERVER>','PSBRKDSP_dflt','/APP/psft/<DEV_SITE_NAME>/appserv/<DEV_ENVIRONMENT>',0,'ACT',0,0,NULL);

COMMIT;

