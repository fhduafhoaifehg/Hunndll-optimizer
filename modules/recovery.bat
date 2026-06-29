:sfc
cls
echo ============================================================
echo                    HUNNDLL$ SAFETY NOTICE
echo ============================================================
echo.
echo Selected Module : RCV-04
echo Operation       : System File Checker
echo.
echo ------------------------------------------------------------
echo.
echo This tool scans and repairs corrupted Windows
echo system files.
echo.
echo Estimated Time : 5 - 20 Minutes
echo.
echo Do NOT close this window while the scan is running.
echo.
echo ============================================================
choice /c YN /m "Continue"

if errorlevel 2 goto menu

cls
echo ============================================================
echo HUNNDLL$ - Executing SFC...
echo ============================================================
echo.
sfc /scannow
echo.
echo ============================================================
echo Operation Finished.
echo ============================================================
pause
goto menu

:restorehealth
cls
echo ============================================================
echo WARNING
echo ============================================================
echo.
echo DISM Restore Health will attempt to repair
echo the Windows image.
echo.
echo This process may require an Internet connection
echo and can take a long time.
echo.
choice /c YN /m "Continue"

if errorlevel 2 goto menu

cls
echo Running DISM Restore Health...
echo.
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto menu

:chkdsk
cls
echo ============================================================
echo WARNING
echo ============================================================
echo.
echo CHKDSK scans the drive for file system errors.
echo.
echo If the drive is in use, Windows may ask to
echo schedule the scan for the next restart.
echo.
choice /c YN /m "Continue"

if errorlevel 2 goto menu

cls
echo Running Check Disk...
echo.
chkdsk C:
pause
goto menu