@echo off
title HUNNDLL$ - System Optimizer
color 0F
cls

echo ============================================================
echo                  HUNNDLL$ - OPT-01
echo                  System Optimizer
echo ============================================================
echo.

echo [1/5] Flushing DNS Cache...
ipconfig /flushdns >nul
echo [ OK ]
echo.

echo [2/5] Cleaning User Temp...
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%i in ("%temp%\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]
echo.

echo [3/5] Cleaning Windows Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i" >nul 2>&1
echo [ OK ]
echo.

echo [4/5] Enabling High Performance Power Plan...
powercfg /setactive SCHEME_MIN >nul 2>&1
echo [ OK ]
echo.

echo [5/5] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo [ OK ]
echo.

echo ============================================================
echo Optimization completed successfully.
echo ============================================================
pause
exit