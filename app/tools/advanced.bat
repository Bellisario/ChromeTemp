@echo off

cd ..\
title ChromeTemp - Advanced Mode
echo This mode will disable all extensions and allows user to manage when session end manually (this can be useful for browser restart).
echo Press any key to run ChromeTemp with advanced user control...
echo.
echo Before continue: make sure what you are doing, this mode allow you to make things can change all your installed Chrome (ex. updating it), that is disabled in normal mode.
echo (Just close the window to don't proceed)
pause>nul
start run.bat advanced
timeout /t 1 /nobreak>nul