set CUR_DIR=%cd%
set DIR=%SystemRoot%\System32\GroupPolicy\User\Scripts

set FILE=%DIR%\Logon\logon.bat
echo set DIR=%%UserProfile%%\Documents\WorkingTable> %FILE%
echo md %%DIR%%>> %FILE%
echo set CUR_YYYY=%%date:~6,4%%>> %FILE%
echo set CUR_MM=%%date:~3,2%%>> %FILE%
echo set CUR_DD=%%date:~0,2%%>> %FILE%
echo set CUR_HH=%%time:~0,2%%>> %FILE%
echo set CUR_II=%%time:~3,2%%>> %FILE%
echo set CUR_SS=%%time:~6,2%%>> %FILE%
echo set DATA=%%CUR_YYYY%%/%%CUR_MM%%/%%CUR_DD%%, %%CUR_HH%%:%%CUR_II%%:%%CUR_SS%%>> %FILE%
echo set FILE=%%DIR%%\WorkingTable_%%CUR_YYYY%%-%%CUR_MM%%.txt>> %FILE%
echo echo Coming: "%%DATA%%"^>^> %%FILE%%>> %FILE%

set FILE=%DIR%\Logoff\logoff.bat
echo set DIR=%%UserProfile%%\Documents\WorkingTable> %FILE%
echo md %%DIR%%>> %FILE%
echo set CUR_YYYY=%%date:~6,4%%>> %FILE%
echo set CUR_MM=%%date:~3,2%%>> %FILE%
echo set CUR_DD=%%date:~0,2%%>> %FILE%
echo set CUR_HH=%%time:~0,2%%>> %FILE%
echo set CUR_II=%%time:~3,2%%>> %FILE%
echo set CUR_SS=%%time:~6,2%%>> %FILE%
echo set DATA=%%CUR_YYYY%%/%%CUR_MM%%/%%CUR_DD%%, %%CUR_HH%%:%%CUR_II%%:%%CUR_SS%%>> %FILE%
echo set FILE=%%DIR%%\WorkingTable_%%CUR_YYYY%%-%%CUR_MM%%.txt>> %FILE%
echo echo Leaving: "%%DATA%%"^>^> %%FILE%%>> %FILE%
echo echo --------------------------------^>^> %%FILE%%>> %FILE%
