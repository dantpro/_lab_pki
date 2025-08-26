$ca_cn_name = "cnt-ca-root"
$ca_srv_name = "cnt-pki-0"

$src_path = "C:\Windows\System32\CertSrv\CertEnroll\"
$dst_path = "C:\ca\web\pki\"

$aia_full_path_src =  $src_path + $ca_srv_name + "_" + $ca_cn_name + ".crt"
$aia_full_path_dst =  $dst_path + $ca_cn_name + ".crt"

$crl_full_path_src =  $src_path + $ca_cn_name + ".crl"
$crl_full_path_dst =  $dst_path + $ca_cn_name + ".crl"

Copy-Item -Path $aia_full_path_src -Destination $aia_full_path_dst -Force -PassThru
Copy-Item -Path $crl_full_path_src -Destination $crl_full_path_dst -Force -PassThru
