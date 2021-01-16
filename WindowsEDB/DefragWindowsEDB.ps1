# esentutl.exe (Extensible Storage Engine Utilities) —  утилиты обслуживания таких баз EDB 
# Если при выполнении команды esentutl появляется ошибка:
# Operation terminated with error -1213 (JET_errPageSizeMismatch, The database page size does not match the engine) after 10.125 seconds
# Это означает что ваша система 64 битная и для выполнения дефрагментации нужно использовать x32 версию esentutl. 
# В этом случае третья команда будет выглядеть так:
# "C:\Windows\SysWOW64\esentutl.exe" /d %AllUsersProfile%\Microsoft\Search\Data\Applications\Windows\Windows.edb
#
sc config wsearch start=disabled
sc stop wsearch
esentutl.exe /d %ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb
sc config wsearch start=delayed-auto
sc start wsearch