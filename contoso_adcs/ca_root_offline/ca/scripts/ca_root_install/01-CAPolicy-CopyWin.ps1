$script_path = $MyInvocation.MyCommand.Path | Split-Path -Parent
$capolicy_full_path =  $script_path + "\CAPolicy.inf"

Copy-Item -Path $capolicy_full_path -Destination "C:\Windows\" -Force -PassThru
