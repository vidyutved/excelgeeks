@echo off
title StudyHub Launcher
color 0B
echo.
echo  =============================================
echo     StudyHub - Your Personal Study Companion
echo  =============================================
echo.
echo  Checking Python installation...
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo  [ERROR] Python is not installed on this PC.
    echo  Please install Python 3 from https://www.python.org
    echo.
    pause
    exit /b 1
)
echo  Python found! Starting StudyHub...
echo.
echo  Your browser will open automatically.
echo  To stop StudyHub, close this window.
echo.
cd /d "%~dp0"
python server.py
pause
