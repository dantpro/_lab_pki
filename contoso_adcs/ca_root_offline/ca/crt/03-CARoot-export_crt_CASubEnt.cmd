@echo off

SET caroot_server_name="cnt-pki-0"
SET caroot_cn="cnt-ca-root"
SET caroot_req_num=2

SET casub_cn=cnt-ca-subent
SET casub_cert_file="c:\ca\crt\%casub_cn%.crt"

certreq -config "%caroot_server_name%\%caroot_cn%" -q -retrieve %caroot_req_num%  %casub_cert_file%

copy %casub_cert_file% c:\ca\web\pki

dir c:\ca\web\pki

echo.
pause
