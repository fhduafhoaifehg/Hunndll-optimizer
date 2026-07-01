@echo off
title HVNNDLL$ - Game Mode
color 0F

:menu
cls
echo ============================================================
echo                  HVNNDLL$ - GME-05
echo                      Game Mode
echo ============================================================
echo.
echo [1] Enable Game Mode
echo [2] Disable Game Mode (restore defaults)
echo [0] Return
echo.
echo ============================================================
choice /c 120 /n /m "Select Option > "
if errorlevel 3 exit /b
if errorlevel 2 goto disable
if errorlevel 1 goto enable

:enable
cls
echo ============================================================
echo              Enabling Game Mode
echo ============================================================
echo.

echo [1/8] Activating High Performance Power Plan...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
echo [ OK ]

echo [2/8] Disabling Visual Effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo [ OK ]

echo [3/8] Stopping Unnecessary Services...
sc stop SysMain >nul 2>&1
sc stop WSearch >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc stop WMPNetworkSvc >nul 2>&1
sc stop XboxGipSvc >nul 2>&1
sc stop XboxNetApiSvc >nul 2>&1
echo [ OK ]

echo [4/8] Killing Background Processes...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im Skype.exe >nul 2>&1
taskkill /f /im Discord.exe >nul 2>&1
taskkill /f /im Spotify.exe >nul 2>&1
echo [ OK ]

echo [5/8] Flushing DNS Cache...
ipconfig /flushdns >nul
echo [ OK ]

echo [6/8] Optimizing Network for Gaming...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh winsock reset >nul 2>&1
echo [ OK ]

echo [7/8] Setting Explorer High Priority...
wmic process where name="explorer.exe" CALL setpriority 256 >nul 2>&1
echo [ OK ]

echo [8/8] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo [ OK ]

echo.
echo ============================================================
echo Game Mode Enabled.
echo ============================================================
pause
goto menu

:disable
cls
echo ============================================================
echo              Disabling Game Mode
echo ============================================================
echo.

echo Restoring Balanced Power Plan...
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1

echo Restoring Visual Effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul

echo Restarting Services...
sc start SysMain >nul 2>&1

echo.
echo ============================================================
echo Game Mode Disabled.
echo ============================================================
pause
goto menu