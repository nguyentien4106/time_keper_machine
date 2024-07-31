@echo off
setlocal

echo Checking for Node.js installation...

:: Check if Node.js is installed
node -v >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Node.js is not installed. Please install Node.js first.
    pause
    exit /b %ERRORLEVEL%
) else (
    echo Node.js is already installed.
)

echo Checking for Node-RED installation...

:: Check if Node-RED is installed
where node-red >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Node-RED is not installed. Installing Node-RED...

    :: Install Node-RED
    npm install -g --unsafe-perm node-red
    if %ERRORLEVEL% NEQ 0 (
        echo Node-RED installation failed!
        pause
        exit /b %ERRORLEVEL%
    )
    echo Node-RED installed successfully.
) else (
    echo Node-RED is already installed.
)

echo Installation check completed.
endlocal
