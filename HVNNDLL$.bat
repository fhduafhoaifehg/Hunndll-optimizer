@echo off
title HVNNDLL$ Utility Framework
color 0F
mode con: cols=60 lines=30

:boot
cls
echo.
echo.
echo.
echo.
echo.                           $
echo.
echo.
echo.
timeout /t 1 >nul

cls
echo.
echo.
echo.
echo.
echo.                           $
echo.
echo Initializing Runtime.............OK
timeout /t 1 >nul

cls
echo.
echo.
echo.
echo.
echo.                           $
echo.
echo Initializing Runtime.............OK
echo Loading Modules..................OK
timeout /t 1 >nul

cls
echo.
echo.
echo.
echo.
echo.                           $
echo.
echo Initializing Runtime.............OK
echo Loading Modules..................OK
echo Checking Environment.............OK
timeout /t 1 >nul

cls
echo.
echo.
echo.
echo.
echo.                           $
echo.
echo Initializing Runtime.............OK
echo Loading Modules..................OK
echo Checking Environment.............OK
echo Checking Administrator...........OK
timeout /t 1 >nul

cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.                      HVNNDLL$
timeout /t 1 >nul

goto menu

:menu
cls
echo ============================================================
echo                        HVNNDLL$
echo                 Windows Utility Framework
echo ============================================================
echo.
echo  [1]  System Optimizer
echo  [2]  Temporary Cleaner
echo  [3]  System Information
echo  [4]  System Recovery
echo  [5]  Game Mode
echo  [6]  Configuration
echo  [7]  Session Logs
echo.
echo  [0]  Exit
echo.
echo ============================================================
choice /c 12345670 /n /m "Select Module > "
if errorlevel 8 goto exit
if errorlevel 7 call "%~dp0modules\logs.bat"
if errorlevel 6 call "%~dp0modules\config.bat"
if errorlevel 5 call "%~dp0modules\gamemode.bat"
if errorlevel 4 call "%~dp0modules\recovery.bat"
if errorlevel 3 call "%~dp0modules\info.bat"
if errorlevel 2 call "%~dp0modules\cleaner.bat"
if errorlevel 1 call "%~dp0modules\optimizer.bat"
goto menu

:exit
cls
echo ============================================================
echo.
echo Session terminated.
echo.
echo Thank you for using HVNNDLL$.
echo.
echo Sometimes less is better.
echo.
echo Dedicated to my future wife, Louisiana.
echo.
echo ============================================================
timeout /t 2 >nul
exit