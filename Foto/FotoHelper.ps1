# Выполняем поиск фотографий и видеороликов на основе даты модификации и переносим их в каталоги на основе даты
$folder="D:\Foto"
$files = Get-ChildItem $folder\* -File

foreach ($file in $files) {
    $filedate=((Get-ChildItem $file).LastWriteTime.toString('yyyy.MM.dd'))

    $folderDest="$folder\$filedate\"

    if(!(Test-Path $folderDest))
    {
        New-Item -Path $folderDest -ItemType Directory -Force | Out-Null
    }

    Move-Item $file $folderDest -Verbose
}