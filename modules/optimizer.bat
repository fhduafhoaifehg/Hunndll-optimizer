@echo off
title HVNNDLL$ - System Optimizer
color 0F
cls

echo ============================================================
echo                  HVNNDLL$ - OPT-01
echo                  System Optimizer
echo ============================================================
echo.

echo [1/14] Flushing DNS Cache...
ipconfig /flushdns >nul
echo [ OK ]

echo [2/14] Resetting TCP/IP Stack...
netsh int ip reset >nul 2>&1
echo [ OK ]

echo [3/14] Enabling High Performance Power Plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo [ OK ]

echo [4/14] Disabling Visual Effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo [ OK ]

echo [5/14] Disabling Unnecessary Services...
sc stop SysMain >nul 2>&1
sc config SysMain start=disabled >nul 2>&1
sc stop WSearch >nul 2>&1
sc config WSearch start=disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start=disabled >nul 2>&1
sc stop WMPNetworkSvc >nul 2>&1
sc config WMPNetworkSvc start=disabled >nul 2>&1
sc stop XboxGipSvc >nul 2>&1
sc config XboxGipSvc start=disabled >nul 2>&1
sc stop XboxNetApiSvc >nul 2>&1
sc config XboxNetApiSvc start=disabled >nul 2>&1
echo [ OK ]

echo [6/14] Cleaning User Temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]

echo [7/14] Cleaning Windows Temp...
del /f /s /q "%windir%\Temp\*" >nul 2>&1
for /d %%i in ("%windir%\Temp\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]

echo [8/14] Cleaning Prefetch...
del /f /s /q "%windir%\Prefetch\*" >nul 2>&1
echo [ OK ]

echo [9/14] Cleaning SoftwareDistribution Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "%windir%\SoftwareDistribution\Download\*" >nul 2>&1
for /d %%i in ("%windir%\SoftwareDistribution\Download\*") do rd /s /q "%%i" >nul 2>&1
net start wuauserv >nul 2>&1
echo [ OK ]

echo [10/14] Cleaning Recent Documents...
del /f /q "%USERPROFILE%\Recent\*" >nul 2>&1
echo [ OK ]

echo [11/14] Cleaning Windows Event Logs...
wevtutil cl Application >nul 2>&1
wevtutil cl System >nul 2>&1
wevtutil cl Security >nul 2>&1
wevtutil cl Setup >nul 2>&1
echo [ OK ]

echo [12/14] Optimizing Network Settings...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
echo [ OK ]

echo [13/14] Disabling Startup Programs...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f >nul 2>&1
echo [ OK ]

echo [14/14] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo [ OK ]

echo.
echo ============================================================
echo Optimization completed. Restart recommended.
echo ============================================================
pause
exit