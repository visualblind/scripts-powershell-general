Get-ADComputer -Filter "Name -eq 'SERVER1' -or Name -eq 'SERVER01'" -Properties * | select name, objectSid, ObjectGUID | ft
