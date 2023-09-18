# Script help from: https://red-gate.com/simple-talk/sysadmin/powershell/how-to-use-parameters-in-powershell/
$pref=$args[0]
$server=$args[1]
$table = @()

for ($i = 0; $i -lt 255; $i++){
	$ipaddr = "$pref.$i"
	$result = Resolve-DnsName - DnsOnly $ipaddr -Server $server -ErrorAction Ignore
	if ($result){
		$ipTable = New-Object PSObject -Property @{
			IPAddress = $ipaddr
			NameHost = $result.NameHost
			}
		$table += $ipTable
	}
}
$table | Select-Object IPAddress, NameHost | Format-Table -AutoSize
