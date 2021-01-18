cd "D:\Download"

$file1 = "*Прочти перед изучением!.docx"
$file2 = "SHAREWOOD_ZERKALO_COM_90000_курсов_на_нашем_форуме!.url"

Get-ChildItem .\* -Include $file1,$file2 -Recurse | Remove-Item -Force
Get-ChildItem .\* -Include $file1,$file2 -Recurse