ls "c:\inetpub" -recurse -Filter "*.config" | Select-string -pattern "HandoverPDFEnabled"