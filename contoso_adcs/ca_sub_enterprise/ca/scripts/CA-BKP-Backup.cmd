@echo off

SET CASrvName=cnt-pki-1
SET CACnName=cnt-ca-subent

SET BkpDrv=C:
SET BkpPath=\ca\bkp

%BkpDrv%
cd %BkpPath%\db

echo Backing up ADCS DB...
echo.
%systemroot%\system32\certutil -backup -v -f -p P@ssw0rd %BkpDrv%%BkpPath%\db
echo.

cd %BkpPath%\reg

echo Backing up registry settings...
echo.
reg export HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CertSvc\Configuration %CASrvName%_%CACnName%_cfg.reg /y
reg save HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CertSvc %CASrvName%_%CACnName%_cfg.hiv /y
echo.

echo Restarting ADCS service...
echo.
net stop CertSvc && net start CertSvc
echo.

echo Backing up CAPolicy file...
echo.
copy /Y %windir%\CAPolicy.inf %BkpDrv%%BkpPath%\inf

dir %BkpDrv%%BkpPath%\inf

cd %BkpPath%

echo Backup time: > %CASrvName%.txt
echo. >> %CASrvName%.txt
date /t >>%CASrvName%.txt
echo.
time /t >>%CASrvName%.txt

::robocopy c:\ca\bkp\ \\contoso.lab\dfs\backup\pki\cnt-pki-1\ /PURGE /S /R:5 /W:60 /TEE /NP /LOG:c:\ca\scripts\_cnt-ca-subent_backup_copy.log
