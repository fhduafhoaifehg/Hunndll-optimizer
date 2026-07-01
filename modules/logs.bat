@echo off
title HVNNDLL$ - Session Logs
color 0F
cls

echo ============================================================
echo                  HVNNDLL$ - LOG-07
echo                    Session Logs
echo ============================================================
echo.
set "LOG_FILE=%~dp0..\hvnn_session.log"

if not exist "%LOG_FILE%" (
    echo No logs found.
    echo.
    echo Session logging will be available when
    echo the main framework records operations.
    echo.
    echo ============================================================
    pause
    exit /b
)

echo Recent session log entries:
echo.
type "%LOG_FILE%"
echo.
echo ============================================================
echo To clear logs, press Y.
choice /c YN /m "Clear logs?"
if errorlevel 2 exit /b
del /f /q "%LOG_FILE%" >nul 2>&1
echo [ OK ] Logs cleared.
echo.
pause
exit