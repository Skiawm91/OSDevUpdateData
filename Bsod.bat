@echo off
call ..\NVRAM\NVRAMDecode\nvram.bat
cd ..
if "%syschannel%" == "PreDev" (title SkholCore System) else (title Sakura Inc. OneOS) 
color 07
goto bsodscreen

:bsodscreen
cls
echo          =
echo         =
echo ::::    =
echo ::::    =  
echo         =
echo         =
echo ::::    =
echo ::::    =
echo         =
echo          =
echo.
echo Your computer got error, so need restart.
echo Please wait 10 seconds for restart.
echo.
echo Error: %bsoderror%
timeout /t 10 /nobreak >nul
goto reset

:reset
start CoreLoader.bat -bsod
exit
