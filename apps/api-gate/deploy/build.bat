@echo off
setlocal

cd /d "%~dp0\.."

echo === Cleaning up previous build artifacts ===
if exist api-gate-linux-amd64 del /f api-gate-linux-amd64
if exist api-gate-windows-amd64.exe del /f api-gate-windows-amd64.exe
echo Cleanup done

echo === Building Linux amd64 ===
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -o api-gate-linux-amd64 .
echo Linux amd64 build done: api-gate-linux-amd64

echo === Building Windows amd64 ===
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=amd64
go build -ldflags "-H windowsgui" -o api-gate-windows-amd64.exe .
echo Windows amd64 build done: api-gate-windows-amd64.exe

echo === Build complete ===
endlocal