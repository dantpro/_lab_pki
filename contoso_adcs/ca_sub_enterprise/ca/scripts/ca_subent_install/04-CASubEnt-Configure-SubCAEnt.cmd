@echo off
::
:: Script parameters
::
SET pki_url="http://pki.contoso.lab/pki"
SET pki_pub_path="c:\ca\web\pki"

::Define CRL Publication Intervals
::
certutil -setreg CA\CRLPeriodUnits 7
certutil -setreg CA\CRLPeriod "Days"

:: Delta CRL
certutil -setreg CA\CRLDeltaPeriodUnits 1
certutil -setreg CA\CRLDeltaPeriod "Days"

:: Overlap CRL period
certutil -setreg CA\CRLOverlapPeriod "Hours"
certutil -setreg CA\CRLOverlapUnits 24

::Apply the required CDP Extension URLs
certutil -setreg CA\CRLPublicationURLs "65:%pki_pub_path%\%%3%%8%%9.crl\n65:%windir%\system32\CertSrv\CertEnroll\%%3%%8%%9.crl\n6:%pki_url%/%%3%%8%%9.crl\n79:ldap:///CN=%%7%%8,CN=%%2,CN=CDP,CN=Public Key Services,CN=Services,%%6%%10"

::Apply the required AIA Extension URLs
certutil -setreg CA\CACertPublicationURLs "1:%pki_pub_path%\%%3.crt\n1:%windir%\system32\CertSrv\CertEnroll\%%3.crt\n2:%pki_url%/%%3.crt\n2:ldap:///CN=%%7,CN=AIA,CN=Public Key Services,CN=Services,%%6%%11"

::Enable all auditing events
certutil -setreg CA\AuditFilter 127

::Set Validity Period for Issued Certificates
::
:: Long for production
certutil -setreg CA\ValidityPeriodUnits 5
certutil -setreg CA\ValidityPeriod "Years"
::
:: Short for test
::certutil -setreg CA\ValidityPeriodUnits 2
::certutil -setreg CA\ValidityPeriod "Weeks"

::Restart Certificate Services
net stop certsvc && net start certsvc 

:: Publish CRL
certutil -crl
