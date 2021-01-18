# Выполняем поиск каталогов и группируем их по годам
$CurrentFolder="D:\Foto"
$folders = Get-ChildItem $CurrentFolder\* -dir
foreach ($folder in $folders) {
    $folderArray=$folder.Name.Split('.')

    if ($folderArray.Count -gt 2)
    {
        $folderYear=$folderArray[0]

        $folderDest="$CurrentFolder\$folderYear\"

        if(!(Test-Path $folderDest))
        {
            New-Item -Path $folderDest -ItemType Directory -Force | Out-Null
        }

        Move-Item $folder $folderDest -Verbose
    }
}