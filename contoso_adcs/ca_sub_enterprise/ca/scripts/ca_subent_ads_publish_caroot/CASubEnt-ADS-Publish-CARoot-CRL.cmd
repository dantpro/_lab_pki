@echo off

SET caroot_cn=cnt-ca-root
SET caroot_crl_file="c:\ca\web\pki\%caroot_cn%.crl"

:: DS Publish CRL
certutil -dspublish -f %caroot_crl_file%

::echo.
::pause

:: Standalone Comp Cert Store
::
::certutil –addstore –f root %caroot_crl_file%
