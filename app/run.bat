@echo off

title ChromeTemp

if exist app cd app
set urlToLoad=https://start.duckduckgo.com/
set welcome="file:///%cd%/welcome.html?url=%urlToLoad%"
set welcomeAdvanced="file:///%cd%/welcome.html?url=%urlToLoad%&advanced=true"
set extensionManager="%cd%/extensions/manager/"
set extensionDDG="%cd%/extensions/duckduckgo/"
set extensionUpdater="%cd%/extensions/update-checker/"
cd ..\temps
set temp="%cd%"
set folder="%cd%\chromeTemp-%random%"
set advanced=0
if "%~1"=="" goto :noAdvanced
set advanced=1
:noAdvanced

mkdir %folder%

REM Locate Chrome
set "Command="
for /f "tokens=2,*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Google Chrome\shell\open\command" /ve 2^>nul') do set "Command=%%~B"
if not defined Command for /f "tokens=2,*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Clients\StartMenuInternet\Google Chrome\shell\open\command" /ve 2^>nul') do set "Command=%%~B"
if not defined Command goto :noChrome
if defined Command goto :startChrome

:startChrome
if %advanced% == 1 goto :startChromeAdvanced
start "" /WAIT "chrome" --start-maximized --no-default-browser-check --no-first-run --user-data-dir=%folder% %welcome% --load-extension=%extensionManager%,%extensionUpdater%,%extensionDDG%
echo ChromeTemp started: waiting for close.
goto :endStartChrome
:startChromeAdvanced
start "" "chrome" --start-maximized --user-data-dir=%folder% %welcomeAdvanced%
echo ChromeTemp started
echo Press any key to end and remove files...
goto :waitEnd
:endStartChrome

:try
timeout /t 5 /nobreak>nul
if not exist %folder%\lockfile goto :check
goto :try

:check
if exist %folder% goto :removeDir
goto :end

:waitEnd
pause>nul
if exist %folder%\lockfile goto :removeError
goto :removeDir
:removeError
echo.
echo Error: seems you are still using ChromeTemp.
echo To end, close ChromeTemp first.
echo.
echo Press any key to end and remove files...
goto :waitEnd
:removeDir
echo.
echo User ended ChromeTemp use: removing files.
rd %folder% /S /Q
goto :check

:noChrome
cd ..\app
start error.bat

:end

echo End!

timeout /t 5 /nobreak>nul
exit
