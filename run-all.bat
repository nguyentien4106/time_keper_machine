@echo off
setlocal

echo Running file1.bat...
call node_install.bat
if %ERRORLEVEL% NEQ 0 (
    echo node_install.bat failed!
    pause
    exit /b %ERRORLEVEL%
)
echo node_install.bat completed successfully.

echo Running node-red_install.bat...
call node-red_install.bat
if %ERRORLEVEL% NEQ 0 (
    echo node-red_install.bat failed!
    pause
    exit /b %ERRORLEVEL%
)
echo node-red_install.bat completed successfully.

echo Running find_local_ip.bat...
call find_local_ip.bat
if %ERRORLEVEL% NEQ 0 (
    echo find_local_ip.bat failed!
    pause
    exit /b %ERRORLEVEL%
)
echo find_local_ip.bat completed successfully.

echo All batch files executed successfully.
pause
endlocal
