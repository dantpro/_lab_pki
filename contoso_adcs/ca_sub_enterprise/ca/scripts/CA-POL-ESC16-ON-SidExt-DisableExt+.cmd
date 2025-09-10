@echo off

net stop certsvc

certutil -setreg policy\DisableExtensionList +1.3.6.1.4.1.311.25.2
echo.

net start certsvc

pause
