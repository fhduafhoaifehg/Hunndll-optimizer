@echo off
title HUNNDLL$ - Temporary Cleaner
color 0F
cls

echo ============================================================
echo                  HUNNDLL$ - CLN-02
echo                  Temporary Cleaner
echo ============================================================
echo.

echo [1/4] Cleaning User Temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]
echo.

echo [2/4] Cleaning Windows Temp...
del /f /s /q "%windir%\Temp\*" >nul 2>&1
for /d %%i in ("%windir%\Temp\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]
echo.

echo [3/4] Cleaning Prefetch...
del /f /s /q "%windir%\Prefetch\*" >nul 2>&1
echo [ OK ]
echo.

echo [4/4] Empty Recycle Bin? (Y/N)
choice /c YN /n

if errorlevel 2 goto finish

PowerShell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1
echo [ OK ]
echo.

:finish
echo ============================================================
echo Temporary cleaning completed.
echo ============================================================
pause
exit