@echo off
setlocal enabledelayedexpansion

:: Initialize variables
set "wifi_ip="

:: Iterate through each line of 'ipconfig' output
for /f "tokens=1,* delims=:" %%a in ('ipconfig ^| findstr /i "Wi-Fi"') do (
    set "adapter_name=%%b"
)

:: Search for IPv4 address related to the identified Wi-Fi adapter
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set "line=%%a"
    for /f "tokens=1 delims= " %%b in ("!line!") do (
        set "wifi_ip=%%b"
    )
)

:: Output the Wi-Fi IPv4 address
echo Please input this IP Address when do smartconfig setup: %wifi_ip%

pause
endlocal