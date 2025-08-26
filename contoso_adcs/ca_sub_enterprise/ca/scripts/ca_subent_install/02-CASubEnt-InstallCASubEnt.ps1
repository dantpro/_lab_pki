# Install ADCS feature
#
Add-WindowsFeature Adcs-Cert-Authority -IncludeManagementTools

# Configure feature
#
#<#
Install-AdcsCertificationAuthority -CACommonName "cnt-ca-subent" `
    -CADistinguishedNameSuffix "DC=contoso,DC=lab" `
    -CAType EnterpriseSubordinateCA `
    -KeyLength 2048 `
    -HashAlgorithm SHA256 `
    -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" `
    -Force `
    -OverwriteExistingDatabase `
    -OverwriteExistingKey
#>
