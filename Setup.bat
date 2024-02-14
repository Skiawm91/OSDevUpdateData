@echo off
call ..\..\..\etc\ver.bat
if "%majorver%" lss "4" (goto formatinstall)
if "%majorver%" == "3.00.1011 (1A996)" (goto formatinstall)
if "%ver%" == "3.00.1145 (1A1099)" (goto formatinstall)
if "%ver%" == "4.00 (2a1556084dev)" (goto formatinstall)
if "%ver%" == "4.00 (2a1556085dev)" (goto formatinstall)
goto normalinstall

:formatinstall
cd ..\..
del /F /Q *.*
rmdir /S /Q Commands
rmdir /S /Q Drivers
rmdir /S /Q text
md NVRAM
cd SoftwareUpdate
cd OSUpdateData
copy /Y CoreLoader.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y *.core C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y nvram.core C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\NVRAM
copy /Y ver.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc\
if exist ..\..\..\etc\sakosv3.bat (copy /Y sakosv3.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc\)
copy /Y seweb.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\ProgramFiles\SExplorer\
copy /Y Bsod.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
cd ..\..
del /F /Q NowUpdate.tmp
echo temp > UpdateDone.tmp
del /F /Q nvram.core
exit

:normalinstall
copy /Y CoreLoader.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y *.core C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
copy /Y ver.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc\
if exist ..\..\..\etc\sakosv3.bat (copy /Y sakosv3.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\etc\)
copy /Y seweb.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\ProgramFiles\SExplorer\
copy /Y Bsod.bat C:\SakuraPC\Systems\GPT\OneOS\Storage\OneOS\System32\
cd ..
del /F /Q NowUpdate.tmp
echo temp > UpdateDone.tmp
exit
