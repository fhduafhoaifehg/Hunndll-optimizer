@echo off
title HUNNDLL$ - Configuration
color 0F

:menu
cls
echo ============================================================
echo                  HUNNDLL$ - CFG-06
echo                    Configuration
echo ============================================================
echo.
echo [1] About HUNNDLL$
echo [2] Version Information
echo [3] Credits
echo [0] Return
echo.
echo ============================================================
set /p option=Select Option ^>

if "%option%"=="1" goto about
if "%option%"=="2" goto version
if "%option%"=="3" goto credits
if "%option%"=="0" exit /b

goto menu

:about
cls
echo ============================================================
echo                       ABOUT
echo ============================================================
echo.
echo HVNNDLL$ is a modular Windows Utility Framework
echo designed for maintenance, diagnostics and recovery.
echo.
echo ☺
echo.
pause
goto menu

:version
cls
echo ============================================================
echo                    VERSION INFO
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
pause
goto menu