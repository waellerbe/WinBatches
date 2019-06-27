set CUR_DIR=%cd%
set DIR=%SystemRoot%\System32\GroupPolicy\User\Scripts

set FILE=%DIR%\Logon\in.bat
echo set DIR=%%UserProfile%%\Documents\WorkingTable> %FILE%
echo md %%DIR%%>> %FILE%
echo set FILE=%%DIR%%\WorkingTable.txt>> %FILE%
echo set CUR_YYYY=%%date:~6,4%%>> %FILE%
echo set CUR_MM=%%date:~3,2%%>> %FILE%
echo set CUR_DD=%%date:~0,2%%>> %FILE%
echo set CUR_HH=%%time:~0,2%%>> %FILE%
echo set CUR_II=%%time:~3,2%%>> %FILE%
echo set CUR_SS=%%time:~6,2%%>> %FILE%
echo set DATA=%%CUR_YYYY%%/%%CUR_MM%%/%%CUR_DD%%, %%CUR_HH%%:%%CUR_II%%:%%CUR_SS%%>> %FILE%
echo echo In: "%%DATA%%"^>^> %%FILE%%>> %FILE%

set FILE=%DIR%\Logoff\out.bat
echo set DIR=%%UserProfile%%\Documents\WorkingTable> %FILE%
echo md %%DIR%%>> %FILE%
echo set FILE=%%DIR%%\WorkingTable.txt>> %FILE%
echo set CUR_YYYY=%%date:~6,4%%>> %FILE%
echo set CUR_MM=%%date:~3,2%%>> %FILE%
echo set CUR_DD=%%date:~0,2%%>> %FILE%
echo set CUR_HH=%%time:~0,2%%>> %FILE%
echo set CUR_II=%%time:~3,2%%>> %FILE%
echo set CUR_SS=%%time:~6,2%%>> %FILE%
echo set DATA=%%CUR_YYYY%%/%%CUR_MM%%/%%CUR_DD%%, %%CUR_HH%%:%%CUR_II%%:%%CUR_SS%%>> %FILE%
echo echo Out: "%%DATA%%"^>^> %%FILE%%>> %FILE%
echo echo ----------------------------^>^> %%FILE%%>> %FILE%
