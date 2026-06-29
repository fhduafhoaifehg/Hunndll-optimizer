@echo off
title HUNNDLL$ - Game Mode
color 0F

:menu
cls
echo ============================================================
echo                  HUNNDLL$ - GME-05
echo                      Game Mode
echo ============================================================
echo.
echo This module applies temporary performance settings.
echo.
echo [1] Enable Game Mode
echo [2] Disable Game Mode
echo [0] Return
echo.
echo ============================================================
set /p option=Select Option ^>

if "%option%"=="1" goto enable
if "%option%"=="2" goto disable
if "%option%"=="0" exit /b
goto menu

:enable
cls
echo ============================================================
echo                    HUNNDLL$ GAME MODE
echo ============================================================
echo.
echo Applying temporary settings...
echo.

echo [1/3] Activating High Performance Plan...
powercfg /setactive SCHEME_MIN >nul 2>&1
echo [ OK ]
echo.

echo [2/3] Flushing DNS Cache...
ipconfig /flushdns >nul
echo [ OK ]
echo.

echo [3/3] Restarting Windows Explorer...
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
echo Disabling Game Mode...
echo ============================================================
echo.

echo Restoring Balanced Power Plan...
powercfg /setactive SCHEME_BALANCED >nul 2>&1

echo.
echo Game Mode Disabled.
echo.
pause
goto menu