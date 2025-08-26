@echo off

SET CASrvName=cnt-pki-1
SET CACnName=cnt-ca-subent

SET BkpDrv=C:
SET BkpPath=\ca\bkp

echo Unoading %CACnName% ADCS registry settings from HKLM\TMP...
echo.

::reg load HKLM\TMP %BkpDrv%%BkpPath%\reg\%CASrvName%_%CACnName%_cfg.hiv
reg unload HKLM\TMP

pause
