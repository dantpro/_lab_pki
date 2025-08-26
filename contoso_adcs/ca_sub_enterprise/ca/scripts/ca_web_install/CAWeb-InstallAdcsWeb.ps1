# Install Web-WebServer Feature
#
Install-WindowsFeature -Name Web-WebServer,Web-Basic-Auth,Web-Windows-Auth,Web-ASP -IncludeManagementTools

# Install ADCS Web Enrollment Feature
#
Install-WindowsFeature Adcs-Web-Enrollment

# Configiure AdcsWebEnroll
#
# Install-AdcsWebenrollment
# Install-AdcsWebenrollment -CAConfig cnt-pki-1.contoso.lab\cnt-ca-subent -Force


