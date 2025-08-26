@echo off

SET BkpDrv=C:
SET BkpPath=\ca\bkp

%BkpDrv%
cd %BkpPath%\db

echo Press any key for restoring up ADCS DB, Ctrl+C for abort...
pause

echo.
%systemroot%\system32\certutil -restore -v -f -p P@ssw0rd %BkpDrv%%BkpPath%\db
echo.
