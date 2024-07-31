@echo off
setlocal

echo Checking for Node.js installation...

:: Check if Node.js is installed
node -v
if %ERRORLEVEL% NEQ 0 (
    echo Node.js is not installed. Downloading and installing Node.js...

    :: Download Node.js installer (LTS version)
    powershell -Command "Invoke-WebRequest -Uri https://nodejs.org/dist/v18.17.0/node-v18.17.0-x64.msi -OutFile nodejs.msi"
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to download Node.js installer!
        pause
        exit /b %ERRORLEVEL%
    )

    :: Install Node.js silently
    msiexec /i nodejs.msi /quiet /norestart
    if %ERRORLEVEL% NEQ 0 (
        echo Node.js installation failed!
        pause
        exit /b %ERRORLEVEL%
    )

    :: Check if the installation was successful
    node -v
    if %ERRORLEVEL% NEQ 0 (
        echo Node.js installation verification failed!
        pause
        exit /b %ERRORLEVEL%
    )
    echo Node.js installed successfully.
) else (
    echo Node.js is already installed.
)

endlocal
