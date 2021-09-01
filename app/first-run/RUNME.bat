@echo off

title ChromeTemp (first run)
echo -- Welcome to ChromeTemp (first run) --
echo.
echo This file needs to run the first time, because you have to test if Chrome is installed in your computer and create a shortcut to run ChromeTemp.
echo Remember that this will do some things only in this folder and sub-folders, this won't do anything else and doesn't install anything, because it's portable.
echo.
echo.
echo Press any key to check if Chrome is installed...
pause>nul

set "chrome="
for /f "tokens=2,*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\shell\open\command" /ve 2^>nul') do set "chrome=%%~B"
if not defined chrome for /f "tokens=2,*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Clients\StartMenuInternet\Google Chrome\shell\open\command" /ve 2^>nul') do set "chrome=%%~B"
echo.

if not defined chrome goto :noChrome

echo Chrome is installed in your computer, now, let's create the shortcut!
echo (the shortcut will be created in this folder, so, you can locate it where you want)
echo.
echo.
echo Press any key to create the shortcut...
pause>nul

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%cd%\Chrome Temp.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%cd%\app\hidden.vbs" >> CreateShortcut.vbs
echo oLink.Arguments = """%cd%\app\run.bat""" >> createShortcut.vbs
echo oLink.IconLocation = "%cd%\app\icons\chrome-temp.ico, 0" >> createShortcut.vbs
echo oLink.Description = "Chrome Temp" >> createShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs>nul
del CreateShortcut.vbs

echo.

if errorlevel 1 goto :shortcutError
if not exist "Chrome Temp.lnk" goto :shortcutError

echo Shortcut "created", now you can start using ChromeTemp!
echo (for advanced usage: navigate into app/tools/)
echo.
echo.
echo Press any key to exit...
pause>nul

exit

REM Errors
:shortcutError
echo Problems creating the shortcut:
echo for now, you can only use run.bat file in app folder.
goto :errorExit

:noChrome
echo Seems you don't have Chrome installed in your computer:
echo please, install Chrome and re-try.

:errorExit
echo.
echo.
echo Press any key to exit...
pause>nul

exit /B 1