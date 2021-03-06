cd

$svcProc0 = Get-Service -ComputerName si03proc0 | Where-Object {$_.displayName.StartsWith("M3_") -and $_.status -eq "running"}  | Select name
$svcProc1 = Get-Service -ComputerName si03proc1 | Where-Object {$_.displayName.StartsWith("M3_") -and $_.status -eq "running"}  | Select name 
$svcProc2 = Get-Service -ComputerName si03proc2 | Where-Object {$_.displayName.StartsWith("M3_") -and $_.status -eq "running"}  | Select name
$svcProc3 = Get-Service -ComputerName si03proc3 | Where-Object {$_.displayName.StartsWith("M3_") -and $_.status -eq "running"}  | Select name
$svcProc0.GetType()
$svcArray = @();
$svcArray += $svcproc0
$svcArray += $svcproc1
$svcArray += $svcproc2
$svcArray += $svcproc3
$svcArrayUnique = $svcArray | sort Name -unique
$svcArrayUnique.count
#$svcArray = @($svcProc0, $svcProc1, $svcProc2, $svcProc3)
$svcArray.count
$svcArray[1]
$svcArray = $null

$array = Get-Content .\proc-m3-services.txt
$array.GetType()
$array.count

$OutArray = @()
foreach ($element in $array) {
	$OutArray += "ProcessServer.exe /I /N hostservices@aws.sentric.int /P Paysol1 /Servname " + $element + " /ServDisplayName " + $element + " /D " + $element.TrimStart("M3_")
}
$OutArray | out-file a.txt
$OutArray = $null