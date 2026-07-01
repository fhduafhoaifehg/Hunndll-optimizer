@echo off
title HVNNDLL$ - System Recovery
color 0F

:menu
cls
echo ============================================================
echo                  HVNNDLL$ - RCV-04
echo                  System Recovery
echo ============================================================
echo.
echo [1] System File Checker (SFC)
echo [2] DISM Restore Health
echo [3] Check Disk (CHKDSK)
echo [4] System Restore Point
echo [5] Reset Network Stack
echo [0] Return
echo.
echo ============================================================
choice /c 123450 /n /m "Select Module > "
if errorlevel 6 exit /b
if errorlevel 5 goto resetnet
if errorlevel 4 goto restorepoint
if errorlevel 3 goto chkdsk
if errorlevel 2 goto dism
if errorlevel 1 goto sfc

:sfc
cls
echo ============================================================
echo          System File Checker
echo ============================================================
echo.
echo Scans and repairs corrupted Windows system files.
echo Estimated time: 5-20 minutes.
echo.
choice /c YN /m "Continue?"
if errorlevel 2 goto menu
cls
echo Running SFC /SCANNOW...
echo.
sfc /scannow
echo.
pause
goto menu

:dism
cls
echo ============================================================
echo          DISM Restore Health
echo ============================================================
echo.
echo Repairs the Windows system image.
echo May require Internet connection.
echo Estimated time: 10-30 minutes.
echo.
choice /c YN /m "Continue?"
if errorlevel 2 goto menu
cls
echo Running DISM /RestoreHealth...
echo.
DISM /Online /Cleanup-Image /RestoreHealth
echo.
pause
goto menu

:chkdsk
cls
echo ============================================================
echo          Check Disk (CHKDSK)
echo ============================================================
echo.
echo Scans for file system errors and bad sectors.
echo.
choice /c YN /m "Continue?"
if errorlevel 2 goto menu
cls
echo Running CHKDSK on C:...
echo.
chkdsk C: /f /r
echo.
pause
goto menu

:restorepoint
cls
echo ============================================================
echo          System Restore Point
echo ============================================================
echo.
echo Creating a system restore point...
powershell -Command "Checkpoint-Computer -Description 'HVNNDLL$ Backup' -RestorePointType MODIFY_SETTINGS" 2>nul
if %errorlevel%==0 (
    echo [ OK ] Restore point created.
) else (
    echo [ WARNING ] Could not create restore point.
    echo Ensure System Protection is enabled.
)
echo.
pause
goto menu

:resetnet
cls
echo ============================================================
echo          Reset Network Stack
echo ============================================================
echo.
echo Resets TCP/IP, Winsock, and DNS cache.
echo.
choice /c YN /m "Continue?"
if errorlevel 2 goto menu
cls
echo Resetting network stack...
netsh int ip reset >nul
netsh winsock reset >nul
ipconfig /flushdns >nul
echo [ OK ] Network stack reset. Reboot recommended.
echo.
pause
goto menu