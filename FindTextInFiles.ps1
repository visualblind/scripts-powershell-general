ls "c:\inetpub" -recurse -Filter "*.config" | Select-string -pattern "StringInsideFile"
