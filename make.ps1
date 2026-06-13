# DO NOT RUN ON ISE
# Set-ExecutionPolicy -Scope Process Unrestricted

# envs
$newPath = @(
  "$env:USERPROFILE\bin"
  "$env:LOCALAPPDATA\Microsoft\WindowsApps"
) -join ";"

[System.Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
$env:PATH = $newPath + ";" + $env:PATH

$ErrorActionPreference = "Stop"

$DOTFILES = "$env:USERPROFILE\.dotfiles"

Set-Location $DOTFILES
git config --global core.autoCRLF false
git submodule update --init

winget install -e --id Microsoft.WindowsTerminal --version 1.24.11321.0
winget install -e --id DevToys-app.DevToys --version 2.0-preview.9
winget install -e --id AutoHotkey.AutoHotkey --version 2.0.26
winget install -e --id Obsidian.Obsidian --version 1.10.6
winget install -e --id Microsoft.PowerShell --version  7.5.5.0
winget install -e --id Microsoft.Sysinternals.Ctrl2Cap --version 3.0
winget install -e --id Microsoft.PowerToys --version 0.100.0 --source winget
winget install -e --id jdx.mise --version 2025.11.9
winget install -e --id NickeManarin.ScreenToGif --version 2.42.1
echo 'mise activate pwsh | Out-String | Invoke-Expression' >> $HOME\Documents\PowerShell\Profile.ps1

# profile
$PSUSERHOME = $profile -replace "^(.*)\\.*$", "`$1" -replace "^(.*)\\.*$", "`$1"
## Windows Powershell
New-Item $PSUSERHOME\WindowsPowerShell -Force -ItemType Directory

# vscode
New-Item $env:APPDATA\Code\User -Force -ItemType Directory
New-Item $env:APPDATA\Code\User\snippets -Force -ItemType Directory

# Windows Terminal
New-Item -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -Force -ItemType Directory

# ssh
New-Item -Path $env:USERPROFILE\.ssh -Force -ItemType Directory

# runas
Start-Process powershell.exe ("-NoProfile -noexit -ExecutionPolicy Unrestricted -Command cd " + $env:USERPROFILE + "\.dotfiles; .\runas.ps1") -Verb runas

# ghq
New-Item $env:USERPROFILE\src -Force -ItemType Directory

