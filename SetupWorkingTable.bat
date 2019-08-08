::WorkingTable script ver:1.0
@echo off
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
echo for /F "tokens=3 delims=/," %%%%G in ('FINDSTR /C:"Coming" %%FILE%%') do set DAY=%%%%G>> %FILE%
echo if [%%DAY%%]==[%%CUR_DD%%] (>> %FILE%
echo   echo Already recorded>> %FILE%
echo ) else (>> %FILE%
echo   echo Coming: "%%DATA%%"^>^> %%FILE%%>> %FILE%
echo )>> %FILE%
::schtasks /create /SC ONLOGON /TN "RunWorkingTableLogon" /TR "%FILE%"

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
echo for /F "tokens=3 delims=/," %%%%G in ('FINDSTR /C:"Leaving" %%FILE%%') do set DAY=%%%%G>> %FILE%
echo if [%%DAY%%]==[%%CUR_DD%%] (>> %FILE%
echo   echo Already recorded>> %FILE%
echo ) else (>> %FILE%
echo   echo Leaving: "%%DATA%%"^>^> %%FILE%%>> %FILE%
echo   echo -------------------------------^>^> %%FILE%%>> %FILE%
echo )>> %FILE%
::schtasks /create /SC ONLOGOFF /TN "RunWorkingTableLogoff" /TR "%FILE%"

goto :continue

set REG_LOGON=HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logon
reg add "%REG_LOGON%\0" /V DisplayName /T REG_SZ /d "Local Group Policy" /f
reg add "%REG_LOGON%\0" /V GPOName /T REG_SZ /d "Local Group Policy" /f
reg add "%REG_LOGON%\0" /V FileSysPath /T REG_SZ /d "%DIR%" /f
reg add "%REG_LOGON%\0" /V SOM-ID /T REG_SZ /d "Local" /f
reg add "%REG_LOGON%\0" /V GPO-ID /T REG_SZ /d "LocalGPO" /f
reg add "%REG_LOGON%\0" /V PSScriptOrder /T REG_DWORD /d 1 /f
reg add "%REG_LOGON%\0\0" /V Parameters /T REG_SZ /d "" /f
reg add "%REG_LOGON%\0\0" /V Script /T REG_SZ /d "logon.bat" /f
reg add "%REG_LOGON%\0\0" /V IsPowershell /T REG_DWORD /d 1 /f
reg add "%REG_LOGON%\0\0" /V ExecTime /T REG_QWORD /d 0 /f

set REG_LOGOFF=HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff
reg add "%REG_LOGOFF%\0" /V DisplayName /T REG_SZ /d "Local Group Policy" /f
reg add "%REG_LOGOFF%\0" /V GPOName /T REG_SZ /d "Local Group Policy" /f
reg add "%REG_LOGOFF%\0" /V FileSysPath /T REG_SZ /d "%DIR%" /f
reg add "%REG_LOGOFF%\0" /V SOM-ID /T REG_SZ /d "Local" /f
reg add "%REG_LOGOFF%\0" /V GPO-ID /T REG_SZ /d "LocalGPO" /f
reg add "%REG_LOGOFF%\0" /V PSScriptOrder /T REG_DWORD /d 1 /f
reg add "%REG_LOGOFF%\0\0" /V Parameters /T REG_SZ /d "" /f
reg add "%REG_LOGOFF%\0\0" /V Script /T REG_SZ /d "logoff.bat" /f
reg add "%REG_LOGOFF%\0\0" /V IsPowershell /T REG_DWORD /d 1 /f
reg add "%REG_LOGOFF%\0\0" /V ExecTime /T REG_QWORD /d 0 /f

for /F "tokens=2 delims==." %%G in ('FINDSTR /C:"logon.bat" %DIR%\scripts.ini') do set GPOLogon=%%G
if [%GPOLogon%]==[logon] (
  echo Already recorded
) else (
  echo [Logon]>>%DIR%\scripts.ini
  echo 0CmdLine=logon.bat>>%DIR%\scripts.ini
  echo 0Parameters=>>%DIR%\scripts.ini
)
for /F "tokens=2 delims==." %%G in ('FINDSTR /C:"logoff.bat" %DIR%\scripts.ini') do set GPOLogoff=%%G
if [%GPOLogoff%]==[logoff] (
  echo Already recorded
) else (
  echo [Logoff]>>%DIR%\scripts.ini
  echo 0CmdLine=logoff.bat>>%DIR%\scripts.ini
  echo 0Parameters=>>%DIR%\scripts.ini
)

:continue
gpedit.msc
