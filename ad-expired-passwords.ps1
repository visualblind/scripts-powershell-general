﻿Get-ADUser -SearchBase "ou=MyOU,dc=MyDomain,dc=Local" -filter * -properties Name, PasswordNeverExpires, PasswordExpired, PasswordLastSet | where {$_.Enabled -eq "True"} | where {$_.PasswordNeverExpires -eq $false} | where {$_.passwordexpired -eq $true}