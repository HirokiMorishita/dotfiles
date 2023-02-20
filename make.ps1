# DO NOT RUN ON ISE
# Set-ExecutionPolicy -Scope Process Unrestricted

# envs
$newPath = @(
  "$env:USERPROFILE\bin"
  "$env:USERPROFILE\scoop\shims"
  "$env:USERPROFILE\scoop\apps\git\current\usr\bin"
  "$env:LOCALAPPDATA\Microsoft\WindowsApps"
) -join ";"

[System.Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
$env:PATH = $newPath + ";" + $env:PATH

$ErrorActionPreference = "Stop"

$DOTFILES = "$env:USERPROFILE\.dotfiles"

try {
  Get-Command -Name scoop -ErrorAction Stop
}
catch [System.Management.Automation.CommandNotFoundException] {
  Invoke-Expression (new-object net.webclient).downloadstring("https://get.scoop.sh")
}

# git is required by `scoop bucket add *`

$UTILS = @(
  # scoop needs dark and innounp
  "innounp"
  "dark"
  "7zip"
  "git"
)

$PACKAGES = @(
  "bat"
  "fd"
  "fzf"
  "ghq"
  "jq"
  "powertoys"
  "ripgrep"
  "firacode"
  "autohotkey"
  "gh"
  "ctrl2cap"
  "less"
  "delta"
)
scoop install $UTILS
scoop bucket add versions
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add sysinternals
scoop update *
scoop install $PACKAGES


if (Test-Path ("$DOTFILES")) {
  Set-Location $DOTFILES
  git pull
  git submodule update --init
}
else {
  git config --global core.autoCRLF false
  git clone --recursive https://github.com/HirokiMorishita/dotfiles.git $DOTFILES
  Set-Location $DOTFILES
}

winget install --id=Microsoft.WindowsTerminal -e
winget install DevToys
wsl --install -d Ubuntu-20.04

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

