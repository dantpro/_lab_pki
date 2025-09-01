@echo off

certutil -setreg policy\DisableExtensionList +1.3.6.1.4.1.311.25.2
echo.

pause
