# Выведем список 10 самых больших файлов, более 300 МБ.
$FileSize=300 # MB
$size=$FileSize*1024*1024
# Вместо Get-ChildItem можно использовать псевдоним GCi
# Ключ –r (Recurse) указывает, что необходимо рекурсивного обойти все вложенные обьекты (каталоги). 
# При доступе к некоторым каталогам, даже с правами администратора, командлет может вернуть ошибку отказа в доступе.
# Чтобы подавить появление таких ошибок нужен параметр -ErrorAction SilentlyContinue.
# Также можно ограничить проверку определённым уровнем вложенности с помощью параметра –Depth.
# Выполним сортировку в порядке уменьшения размера -descending -property length
# Чтобы избежать вывода размера файлов в байтах, преобразуем их сразу в мегабайты.

Get-ChildItem C:\VBox -r -ErrorAction SilentlyContinue -Depth 3 | `
	where-object {$_.length -gt $size} | `
	Sort-Object -descending -property length | `
    Select-Object -first 10 name, DirectoryName, @{Name="MB";Expression={[Math]::round($_.length / 1MB, 2)}} 

# Другой вариант записи, используя псевдонимы

GCi C:\VBox -r -ErrorAction SilentlyContinue -Depth 3 | `
	where {$_.length -gt $size} | `
	sort -descending -property length | `
    select -first 10 name, DirectoryName, @{Name="MB";Expression={[Math]::round($_.length / 1MB, 2)}} 

# Полученную таблицу можно преобразовать в графическую форму с помощью командлета Out-GridView
