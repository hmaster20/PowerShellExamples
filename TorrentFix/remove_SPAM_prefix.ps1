cd "D:\Download"

dir -r | Rename-Item -NewName { $_.name -replace "\[SW.BAND\]","" }
dir -r | Rename-Item -NewName { $_.name.Trim() }