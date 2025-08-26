$crl_url = "http://pki.contoso.lab/pki/%3.crl"
$aia_url = "http://pki.contoso.lab/pki/%3.crt"

"--- CRL"
Get-CACRLDistributionPoint | Format-Table
"--- AIA"
Get-CAAuthorityInformationAccess | Format-Table

# $crl_list = Get-CACrlDistributionPoint
# foreach ($crl in $crl_list) {
#    Remove-CACrlDistributionPoint $crl.uri -Force
# }

Get-CACrlDistributionPoint |
    Remove-CACrlDistributionPoint -Force

Add-CACRLDistributionPoint -Uri "C:\Windows\System32\CertSrv\CertEnroll\%3.crl" -PublishToServer -Force
Add-CACRLDistributionPoint -Uri $crl_url -AddToCertificateCDP -Force
Add-CACRLDistributionPoint -Uri "ldap:///CN=%7%8,CN=%2,CN=CDP,CN=Public Key Services,CN=Services,%6%10" -AddToCertificateCDP -AddToCrlCdp  -Force

Get-CAAuthorityInformationAccess |
    Where-Object {$_.Uri -like 'ldap*' -or $_.Uri -like 'http*' -or $_.Uri -like 'file*'} | 
    Remove-CAAuthorityInformationAccess -Force

# --Unsupported Uri-- Add-CAAuthorityInformationAccess -Uri "C:\Windows\system32\CertSrv\CertEnroll\%3.crt" -Force
Add-CAAuthorityInformationAccess -Uri $aia_url -AddToCertificateAia -Force
Add-CAAuthorityInformationAccess -Uri "ldap:///CN=%7,CN=AIA,CN=Public Key Services,CN=Services,%6%11" -AddToCertificateAia -Force

Restart-Service certsvc -PassThru

"--- CRL"
Get-CACRLDistributionPoint | Format-Table
"--- AIA"
Get-CAAuthorityInformationAccess | Format-Table

# "--- CRL"
# Get-CACRLDistributionPoint | Format-List
# "--- AIA"
# Get-CAAuthorityInformationAccess | Format-List
