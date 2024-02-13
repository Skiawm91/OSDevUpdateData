@echo off
rmdir /S /Q CoreDecode
rmdir /S /Q NVRAM\NVRAMDecode
md CoreDecode
md NVRAM\NVRAMDecode
certutil -decode Kernel32.core CoreDecode\Kernel32.bat
if not "%~1" == "-bsod" (start conhost.exe CoreDecode\Kernel32.bat) else (start conhost.exe CoreDecode\Kernel32.bat -errlog)
exit