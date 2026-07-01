@echo off
title HVNNDLL$ - System Information
color 0F
cls

echo ============================================================
echo                  HVNNDLL$ - INF-03
echo                System Information
echo ============================================================
echo.

echo ---------- CPU ----------
for /f "skip=1 tokens=*" %%a in ('wmic cpu get Name') do echo %%a & goto cpu_done
:cpu_done
echo.

echo ---------- RAM ----------
for /f "skip=1 tokens=*" %%a in ('wmic memorychip get Capacity') do if not "%%a"=="" (
    set /a cap=%%a/1073741824 2>nul
    if defined cap echo %%cap%% GB
)
wmic computersystem get TotalPhysicalMemory /value | find "="
echo.

echo ---------- GPU ----------
wmic path win32_VideoController get Name | findstr /v /b "Name"
echo.

echo ---------- DISKS ----------
wmic logicaldisk get DeviceID,Size,Freespace | findstr /v "Freespace"
echo.

echo ---------- OS ----------
wmic os get Caption,Version,OSArchitecture | findstr /v "Caption"
echo.

echo ---------- MOTHERBOARD ----------
wmic baseboard get Manufacturer,Product | findstr /v "Manufacturer"
echo.

echo ---------- BIOS ----------
wmic bios get Manufacturer,SMBIOSBIOSVersion,ReleaseDate | findstr /v "Manufacturer"
echo.

echo ---------- NETWORK ----------
wmic nic where "NetEnabled=True" get Name,Speed | findstr /v "Name"
echo.

echo ============================================================
pause
exit