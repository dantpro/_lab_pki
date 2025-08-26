@echo off
::
:: Script parameters
::
SET dom_dn="DC=contoso,DC=lab"
SET pki_url="http://pki.contoso.lab/pki"

::Declare Configuration NC
certutil -setreg CA\DSConfigDN CN=Configuration,%dom_dn%

::Define CRL Publication Intervals
::
::Long for production
::
certutil -setreg CA\CRLPeriodUnits 52
certutil -setreg CA\CRLPeriod "Weeks"
:: no delta crl
certutil -setreg CA\CRLDeltaPeriodUnits 0
certutil -setreg CA\CRLDeltaPeriod "Days"
:: overlap crl period
certutil -setreg CA\CRLOverlapPeriod "Weeks"
certutil -setreg CA\CRLOverlapUnits 2
::
::Short for test
::
::certutil -setreg CA\CRLPeriodUnits 7
::certutil -setreg CA\CRLPeriod "Days"
:: no delta crl
::certutil -setreg CA\CRLDeltaPeriodUnits 0
::certutil -setreg CA\CRLDeltaPeriod "Days"
:: overlap crl period
::certutil -setreg CA\CRLOverlapPeriod "Days"
::certutil -setreg CA\CRLOverlapUnits 2

::Apply the required CDP Extension URLs
certutil -setreg CA\CRLPublicationURLs "1:%windir%\system32\CertSrv\CertEnroll\%%3.crl\n2:%pki_url%/%%3.crl\n10:ldap:///CN=%%7%%8,CN=%%2,CN=CDP,CN=Public Key Services,CN=Services,%%6%%10"

::Apply the required AIA Extension URLs
certutil -setreg CA\CACertPublicationURLs "1:%windir%\system32\CertSrv\CertEnroll\%%3.crt\n2:%pki_url%/%%3.crt\n2:ldap:///CN=%%7,CN=AIA,CN=Public Key Services,CN=Services,%%6%%11"

::Enable all auditing events
certutil -setreg CA\AuditFilter 127

::Set Validity Period for Issued Certificates
:: Long for production
certutil -setreg CA\ValidityPeriodUnits 10
certutil -setreg CA\ValidityPeriod "Years"
::
:: Short for test
::certutil -setreg CA\ValidityPeriodUnits 1
::certutil -setreg CA\ValidityPeriod "Months"

::Restart Certificate Services
net stop certsvc && net start certsvc 

:: Publish CRL
certutil -crl
