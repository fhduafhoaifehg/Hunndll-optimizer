@echo off
title HUNNDLL$ Utility Framework
color 0F
mode con: cols=60 lines=30

:boot
cls
echo ============================================================
echo                        HUNNDLL$
echo                 Windows Utility Framework
echo.
echo                    Build : 1000
echo                 Author : dqllcrsp3
echo.
echo            "Sometimes less is better."
echo.
echo ============================================================
echo.
echo          Dedicated to my future wife, Louisiana.
echo.
echo Initializing Runtime...
timeout /t 1 >nul

echo.
echo Loading Modules.............OK
timeout /t 1 >nul
echo Checking Environment........OK
timeout /t 1 >nul
echo Checking Administrator......OK
timeout /t 1 >nul
echo.
echo System Ready.
timeout /t 2 >nul

:menu
cls
echo ============================================================
echo                        HUNNDLL$
echo                 Windows Utility Framework
echo ============================================================
echo.
echo  [OPT-01]  System Optimizer
echo  [CLN-02]  Temporary Cleaner
echo  [INF-03]  System Information
echo  [RCV-04]  System Recovery
echo  [GME-05]  Game Mode
echo  [CFG-06]  Configuration
echo  [LOG-07]  Session Logs
echo.
echo  [000-00]  Exit
echo.
echo ============================================================
set /p option=Select Module ^>

if "%option%"=="1" (
    echo Abriendo modulo...
    pause
    call "%~dp0modules\optimizer.bat"
)
if "%option%"=="2" call "%~dp0modules\cleaner.bat"
if "%option%"=="3" call "%~dp0modules\info.bat"
if "%option%"=="4" call "%~dp0modules\recovery.bat"
if "%option%"=="5" call "%~dp0modules\gamemode.bat"
if "%option%"=="6" call "%~dp0modules\config.bat"
if "%option%"=="7" call "%~dp0modules\logs.bat"
if "%option%"=="0" goto exit

goto menu

:optimizer
cls
echo Loading HUNN.OPT...
timeout /t 1 >nul
echo.
echo This module is under development.
pause
goto menu

:cleaner
cls
echo Loading HUNN.CLEAN...
timeout /t 1 >nul
echo.
echo This module is under development.
pause
goto menu

:info
cls
echo Loading HUNN.INFO...
timeout /t 1 >nul
echo.
systeminfo
pause
goto menu

:recovery
cls
echo Loading HUNN.RECOVERY...
timeout /t 1 >nul
echo.
echo This module is under development.
pause
goto menu

:gamemode
cls
echo Loading HUNN.GAME...
timeout /t 1 >nul
echo.
echo This module is under development.
pause
goto menu

:config
cls
echo Loading HUNN.CONFIG...
timeout /t 1 >nul
echo.
echo This module is under development.
pause
goto menu

:logs
cls
echo Loading HUNN.LOG...
timeout /t 1 >nul
echo.
echo No session logs available.
pause
goto menu

:exit
cls
echo ============================================================
echo.
echo Session terminated.
echo.
echo Thank you for using HUNNDLL$.
echo.
echo Sometimes less is better.
echo.
echo ============================================================
timeout /t 2 >nul
exit