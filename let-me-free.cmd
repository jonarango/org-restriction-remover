@echo off
echo [!] - Asking For Administrator!
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
echo [!] - Succes! Continuing...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies"
echo [!] - Deleted Domain Limitations: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies
reg delete "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
echo [!] - Deleted Mouse Domain Limitations: HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\DataCollection
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
echo [!] - Deleted Update Limitations: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate
reg delete "HKEY_CURRENT_USER\SOFTWARE\Policies\Google\Chrome"
echo [!] - Removed Local Chrome Policies: HKEY_CURRENT_USER\SOFTWARE\Policies\Google\Chrome
reg delete "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Edge"
echo [!] - Removed Local Edge Policies: HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Edge
echo [!] - Aplying Changes!
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
echo [!] - Done!
pause > null && del null
