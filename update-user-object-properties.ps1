import-module activedirectory
get-aduser trunyard

Get-ADGroupMember "Internal_Users" | export-csv Internal_Users.csv
Get-ADGroupMember "Internal_Users" | get-aduser -Properties samAccountName, name, sid, telephoneNumber, mobile, title, Company, physicalDeliveryOfficeName | Select-Object samAccountName, name, sid, telephoneNumber, mobile, title, Company, physicalDeliveryOfficeName | export-csv a.csv -NoTypeInformation
Import-Csv -Path "Users.csv" | ForEach-Object {Set-ADUser -Identity $($_.sid) -Replace @{telephoneNumber=$($_.telephoneNumber); mobile=$($_.mobile); title=$($_.title); Company=$($_.Company); physicalDeliveryOfficeName=$($_.physicalDeliveryOfficeName)}}

Import-Csv -Path "C:\Scripts\AD Examples\Users\bulkchangetest.csv" |            
foreach {            
  Set-ADUser -Identity $($_.userid) -Replace @{extensionAttribute3 = $($_.JobTitle); extensionAttribute4 = $($_."Cost Center"); extensionAttribute5  = $($_.HireDate)}            
}     




get-aduser trunyard -Properties *


Import-Csv C:\test2.csv | ForEach-Object {
$officephone = $_.OfficePhone
if($officephone.Length -lt 1)
{$officephone = $null}
$HomePhone = $_.HomePhone
if($HomePhone.Length -lt 1)
{$HomePhone = $null}
$MobilePhone = $_.MobilePhone 
if($Mobilephone.Length -lt 1)
{$MobilePhone = $null}

Set-ADUser -Identity $_.samAccountName -OfficePhone $officephone  -HomePhone $HomePhone -mobilephon $MobilePhone 