@echo off
title HVNNDLL$ - Temporary Cleaner
color 0F
cls

echo ============================================================
echo                  HVNNDLL$ - CLN-02
echo                  Temporary Cleaner
echo ============================================================
echo.

echo [1/9] Cleaning User Temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]

echo [2/9] Cleaning Local AppData Temp...
del /f /s /q "%LOCALAPPDATA%\Temp\*" >nul 2>&1
for /d %%i in ("%LOCALAPPDATA%\Temp\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]

echo [3/9] Cleaning Windows Temp...
del /f /s /q "%windir%\Temp\*" >nul 2>&1
for /d %%i in ("%windir%\Temp\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]

echo [4/9] Cleaning Prefetch...
del /f /s /q "%windir%\Prefetch\*" >nul 2>&1
echo [ OK ]

echo [5/9] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
del /f /s /q "%windir%\SoftwareDistribution\Download\*" >nul 2>&1
for /d %%i in ("%windir%\SoftwareDistribution\Download\*") do rd /s /q "%%i" >nul 2>&1
net start wuauserv >nul 2>&1
echo [ OK ]

echo [6/9] Cleaning Recent Documents...
del /f /q "%USERPROFILE%\Recent\*" >nul 2>&1
echo [ OK ]

echo [7/9] Flushing DNS Cache...
ipconfig /flushdns >nul
echo [ OK ]

echo [8/9] Cleaning Windows Event Logs...
wevtutil cl Application >nul 2>&1
wevtutil cl System >nul 2>&1
wevtutil cl Security >nul 2>&1
wevtutil cl Setup >nul 2>&1
echo [ OK ]

echo [9/9] Empty Recycle Bin?
choice /c YN /n /m "Empty Recycle Bin? (Y/N)"
if errorlevel 2 goto finish
PowerShell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo [ OK ]

:finish
echo.
echo ============================================================
echo Cleaning completed.
echo ============================================================
pause
exit