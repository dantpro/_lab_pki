@echo off

SET caroot_server_name="cnt-pki-0"
SET caroot_cn="cnt-ca-root"
SET caroot_req_num=2

certutil -config "%caroot_server_name%\%caroot_cn%" -view -restrict "requestid=%caroot_req_num%" -out rawcertificate

echo.

pause
