@echo off
:: MSX-Works build script (uses the MSXgl build tool)

if not defined MSXGL_PATH set MSXGL_PATH=%~dp0..\MSXgl

pushd "%~dp0"
"%MSXGL_PATH%\tools\build\Node\node.exe" "%MSXGL_PATH%\engine\script\js\build.js" %*
set BUILD_ERR=%ERRORLEVEL%
popd
exit /b %BUILD_ERR%
