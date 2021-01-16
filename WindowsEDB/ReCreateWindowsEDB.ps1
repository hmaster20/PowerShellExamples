# Значение параметра реестра SetupCompletedSuccessfully = 0 в ветке HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search 
# заставляет службу Windows Search при следующем запуске сбросить текущие настройки и пути индексирования, 
# восстановит стандартные параметры wsearch и добавит пути для индексирования по-умолчанию.
# 
net stop "Windows Search"
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
del %PROGRAMDATA%\Microsoft\Search\Data\Applications\Windows\Windows.edb
net start "Windows Search"