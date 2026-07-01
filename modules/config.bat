@echo off
title HVNNDLL$ - Configuration
color 0F

:menu
cls
echo ============================================================
echo                  HVNNDLL$ - CFG-06
echo                   Configuration
echo ============================================================
echo.
echo [1] About HVNNDLL$
echo [2] Version Information
echo [3] Credits
echo [4] Toggle Startup Programs
echo [5] Create Restore Point
echo [0] Return
echo.
echo ============================================================
choice /c 123450 /n /m "Select Option > "
if errorlevel 6 exit /b
if errorlevel 5 goto restorepoint
if errorlevel 4 goto startup
if errorlevel 3 goto credits
if errorlevel 2 goto version
if errorlevel 1 goto about

:about
cls
echo ============================================================
echo                      ABOUT
echo ============================================================
echo.
echo HVNNDLL$ is a modular Windows Utility Framework
echo designed for maintenance, diagnostics and recovery.
echo.
echo Features:
echo - System Optimization
echo - Temporary Cleaning
echo - System Information
echo - Recovery Tools
echo - Game Mode
echo.
pause
goto menu

:version
cls
echo ============================================================
echo                   VERSION INFO
echo ============================================================
echo.
echo Build  : 1000
echo Status : Alpha
echo Author : dqllcrsp3
echo.
pause
goto menu

:credits
cls
echo ============================================================
echo                      CREDITS
echo ============================================================
echo.
echo Lead Developer:
echo dqllcrsp3
echo.
echo Dedicated to my future wife, Louisiana.
echo.
echo "Sometimes less is better."
echo.
pause
goto menu

:startup
cls
echo ============================================================
echo              Startup Programs
echo ============================================================
echo.
echo Current startup entries:
echo.
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" 2>nul
echo.
choice /c YN /m "Disable all startup programs?"
if errorlevel 2 goto menu
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f >nul
echo [ OK ] All startup entries removed.
echo.
pause
goto menu

:restorepoint
cls
echo ============================================================
echo           Create Restore Point
echo ============================================================
echo.
powershell -Command "Checkpoint-Computer -Description 'HVNNDLL$ Backup' -RestorePointType MODIFY_SETTINGS" 2>nul
if %errorlevel%==0 (
    echo [ OK ] Restore point created successfully.
) else (
    echo [ WARNING ] Could not create restore point.
    echo Enable System Protection in System Properties.
)
echo.
pause
goto menu