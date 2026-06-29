@echo off
title HUNNDLL$ - System Information
color 0F
cls

echo ============================================================
echo                    HUNNDLL$ - INF-03
echo                  System Information
echo ============================================================
echo.

echo [CPU]
wmic cpu get Name /value
echo.

echo [MEMORY]
wmic computersystem get TotalPhysicalMemory /value
echo.

echo [GRAPHICS]
wmic path win32_VideoController get Name
echo.

echo [STORAGE]
wmic diskdrive get Model,Size
echo.

echo [OPERATING SYSTEM]
wmic os get Caption,Version
echo.

echo [COMPUTER]
wmic computersystem get Manufacturer,Model
echo.

echo ============================================================
pause
exit