Set-ExecutionPolicy 0
Set-Location "\\server\path\to\dir" 
$DirectoryList = "\\server\path\to\dir" # Build the list 
 
$Folders = Get-ChildItem -Recurse -Force "$DirectoryList" | where{$_.PsIsContainer} | select fullname
 
ForEach ($Folder in $Folders) { 
 
      
       
        $ProfilePath = "$DirectoryList" 
        #write-host "$ProfilePath" 
        
            $Directory = $Folder.fullname
            #write-host $directory 
            #$File =  $Content.name 
            #write-host $file
            $Job = "$Directory" 
            #write-host $job 
            $acl = Get-Acl $job 
            write-host $job "is" ($acl.areaccessrulesprotected) 
            #$acl.areaccessrulesprotected 
            $isProtected = $false 
            $preserveInheritance = $true 
            $acl.SetAccessRuleProtection($isProtected, $preserveInheritance) 
            #$acl.areaccessrulesprotected 
            #write-host $job 
            Set-Acl -Path $job -AclObject $acl 
            write-host $job "is" ($acl.areaccessrulesprotected) 
            
        }
