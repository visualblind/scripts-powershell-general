Get-ChildItem K:\ -recurse -include *.ldf | where-object {$_.length -gt 20GB} | Sort-Object -property length -Descending | Select-Object FullName, @{Name="SizeInMB";Expression={$_.Length / 1MB}},@{Name="Path";Expression={$_.directory}} ft fullname, length -auto