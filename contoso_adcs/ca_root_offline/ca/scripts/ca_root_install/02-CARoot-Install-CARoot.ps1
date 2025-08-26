# Install feature
Add-WindowsFeature Adcs-Cert-Authority -IncludeManagementTools

# Configure feature
Install-AdcsCertificationAuthority -CACommonName "cnt-ca-root" `
    -CAType StandaloneRootCA `
    -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" `
    -HashAlgorithm SHA256 `
    -KeyLength 4096 `
    -ValidityPeriod Years `
    -ValidityPeriodUnits 20 `
    -Force `
    -OverwriteExistingDatabase `
    -OverwriteExistingKey
#
#   -CADistinguishedNameSuffix "O=contoso,C=org" `

# Remove feature
# Remove-WindowsFeature Adcs-Cert-Authority

# Long for prod - 20 years (-HashAlgorithm SHA1/SHA256)
# Install-AdcsCertificationAuthority -CAType StandaloneRootCA -CACommonName "cnt-ca-root" -KeyLength 4096 -HashAlgorithm SHA256 -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" -ValidityPeriod Years -ValidityPeriodUnits 20 -Force
# Install-AdcsCertificationAuthority -CAType StandaloneRootCA -CACommonName "cnt-ca-root" -KeyLength 4096 -HashAlgorithm SHA1 -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" -ValidityPeriod Years -ValidityPeriodUnits 20 -Force -OverwriteExistingDatabase -OverwriteExistingKey
#
# Short for test - 2 month
# Install-AdcsCertificationAuthority -CAType StandaloneRootCA -CACommonName "cnt-ca-root" -KeyLength 4096 -HashAlgorithm SHA256 -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" -ValidityPeriod Month -ValidityPeriodUnits 2 -Force
# Install-AdcsCertificationAuthority -CAType StandaloneRootCA -CACommonName "cnt-ca-root" -KeyLength 4096 -HashAlgorithm SHA256 -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" -ValidityPeriod Month -ValidityPeriodUnits 2 -Force -OverwriteExistingDatabase -OverwriteExistingKey
