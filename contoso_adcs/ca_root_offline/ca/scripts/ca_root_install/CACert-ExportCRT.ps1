$cert_filename = "cnt-ca-root.crt"

$cert_subject =  "CN=cnt-ca-root"
#--- $cert_subject =  "CN=cnt-ca-root, O=contoso, C=org"

$script_path = $MyInvocation.MyCommand.Path |
    Split-Path -Parent

$cert_full_path =  $script_path + "\" + $cert_filename

Get-ChildItem -Path Cert:\LocalMachine\my |
    Where-Object -Property Subject -eq $cert_subject |
    Export-Certificate -Type cert -FilePath $cert_full_path -Force

Move-Item -Path $cert_full_path -Destination "C:\ca\crt\" -Force -PassThru
