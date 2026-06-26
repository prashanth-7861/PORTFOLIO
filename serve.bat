@echo off
REM ============================================================
REM Portfolio Local Server Launcher
REM Starts a local HTTP server so the portfolio works without
REM CORS / file:// issues. Pick whichever you have: Node or Python.
REM ============================================================

setlocal
cd /d "%~dp0"

echo.
echo ============================================================
echo  Prashanth's Portfolio - Local Server
echo ============================================================
echo.

REM Try Node first (npx serve)
where npx >nul 2>&1
if %ERRORLEVEL% EQU 0 (
  echo [OK] Found Node.js
  echo.
  echo Open this URL in your browser:
  echo   http://localhost:3000
  echo.
  echo Press CTRL+C to stop the server.
  echo.
  npx --yes serve -l 3000 .
  goto :end
)

REM Fallback to Python
where python >nul 2>&1
if %ERRORLEVEL% EQU 0 (
  echo [OK] Found Python
  echo.
  echo Open this URL in your browser:
  echo   http://localhost:8000
  echo.
  echo Press CTRL+C to stop the server.
  echo.
  python -m http.server 8000
  goto :end
)

echo [ERROR] Neither Node.js (npx) nor Python found.
echo Install one of them and try again.
echo.
pause

:end
endlocal
