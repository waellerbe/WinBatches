echo off
netsh wlan set hostednetwork mode=allow ssid="Saima" key="home-inet" keyUsage=persistent
:start 
cls
@title WI-FI Network:
echo    COMMANDS:
echo  1 - START
echo  2 - SHOW
echo  3 - STOP
echo  0 - EXIT
echo _______________
set /p var="- ENTER COMMAND> "

@if "%var%" == "0" exit
@if "%var%" == "1" netsh wlan start hostednetwork
@if "%var%" == "2" netsh wlan show hostednetwork
@if "%var%" == "3" netsh wlan stop hostednetwork
pause
goto start
