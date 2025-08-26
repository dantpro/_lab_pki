@echo off

SET CASrvName=cnt-pki-0
SET CACnName=cnt-ca-root

SET BkpDrv=C:
SET BkpPath=\ca\bkp

echo Loading %CACnName% ADCS registry settings to HKLM\TMP...
echo.

reg load HKLM\TMP %BkpDrv%%BkpPath%\reg\%CASrvName%_%CACnName%_cfg.hiv
::reg unload HKLM\TMP

pause
