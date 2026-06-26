@echo off
REM Quick one-click launcher (uses Node only)
cd /d "%~dp0"
start "" "http://localhost:3000"
npx --yes serve -l 3000 .
