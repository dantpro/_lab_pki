@echo off

::https://learn.microsoft.com/en-us/answers/questions/431223/use-certreq-certutil-to-request-and-approve-a-cert

SET caroot_server_name="cnt-pki-0"
SET caroot_cn="cnt-ca-root"

SET casub_server_fqdn="cnt-pki-1.contoso.lab"
SET casub_cn="cnt-ca-subent"

SET certreq_file="c:\ca\crt\%casub_server_fqdn%_%casub_cn%.req"

SET caroot_req_num=2

certreq -config "%caroot_server_name%\%caroot_cn%" -submit %certreq_file%

certutil -config "%caroot_server_name%\%caroot_cn%" -resubmit %caroot_req_num%

certutil -config "%caroot_server_name%\%caroot_cn%" -view -restrict "requestid=%caroot_req_num%" -out rawcertificate
