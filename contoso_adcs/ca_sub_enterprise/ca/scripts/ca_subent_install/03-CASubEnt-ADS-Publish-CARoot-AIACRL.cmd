@echo off

SET caroot_cn=cnt-ca-root
SET caroot_aia_file="c:\ca\web\pki\%caroot_cn%.crt"
SET caroot_crl_file="c:\ca\web\pki\%caroot_cn%.crl"

:: DS Publish CRT/CRL
certutil -dspublish -f %caroot_aia_file% RootCA
certutil -dspublish -f %caroot_crl_file%

echo.
pause

:: Standalone Comp Cert Store
::
::certutil –addstore –f root %caroot_aia_file%
::certutil –addstore –f root %caroot_crl_file%





