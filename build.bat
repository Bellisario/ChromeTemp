@echo off

set build="%cd%\temps\build"
echo|set /p="Building... "
if not exist %build% mkdir %build%
xcopy /S .\app\*.* %build%\app\ /Y>nul || goto :error
copy .\app\first-run\RUNME.bat %build%\RUNME.bat>nul || goto :error
mkdir %build%\temps || goto :error
copy .\temps\README.txt %build%\temps\README.txt>nul || goto :error
echo OK.
echo|set /p="Making zip... "
if exist .\temps\chrome-temp.zip del .\temps\chrome-temp.zip
call ./app/zip.bat zipDirItems -source %build% -destination .\temps\chrome-temp.zip -keep yes -force no || goto :error
echo OK.
echo|set /p="Finishing process... "
if exist .\chrome-temp.zip del .\chrome-temp.zip
move .\temps\chrome-temp.zip .\chrome-temp.zip>nul || goto :error
rd %build% /S /Q>nul
echo OK.
echo.
echo Build complete!

goto :end

:error
echo.
echo.
echo.
echo.
echo Error while building.
exit /B 1

:end
