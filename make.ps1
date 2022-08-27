# DO NOT RUN ON ISE
# Set-ExecutionPolicy -Scope Process Unrestricted

# envs
$newPath = @(
  "$env:USERPROFILE\.poetry\bin"
  "$env:USERPROFILE\.dotnet\tools"
  "$env:USERPROFILE\bin"
  "$env:USERPROFILE\scoop\shims"
  "$env:USERPROFILE\scoop\apps\python\current"
  "$env:USERPROFILE\scoop\apps\python\current\Scripts"
  "$env:USERPROFILE\scoop\apps\nodejs-lts\current\bin"
  "$env:USERPROFILE\scoop\apps\nodejs-lts\current"
  "$env:USERPROFILE\scoop\apps\ruby\current\gems\bin"
  "$env:USERPROFILE\scoop\apps\ruby\current\bin"
  "$env:USERPROFILE\scoop\apps\git\current\usr\bin"
  "$env:USERPROFILE\scoop\apps\git\current\mingw64\bin"
  "$env:USERPROFILE\scoop\apps\git\current\mingw64\libexec\git-core"
  "$env:LOCALAPPDATA\Programs\Python\Launcher"
  "$env:LOCALAPPDATA\Microsoft\WindowsApps"
  "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin"
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
  "aria2"
  "lessmsi"
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
  "vscode"
  "firacode"
  "autohotkey"
)
scoop install $UTILS
scoop bucket add versions
scoop bucket add extras
scoop bucket add java
scoop bucket add nerd-fonts
scoop update *
scoop install $PACKAGES


if (Test-Path ("$DOTFILES")) {
  Set-Location $DOTFILES
  git pull
}
else {
  git config --global core.autoCRLF false
  git clone https://github.com/asumanino/dotfiles.git $DOTFILES
}

winget install --id=Microsoft.WindowsTerminal -e
wsl --install -d ubuntu

# profile
$PSUSERHOME = $profile -replace "^(.*)\\.*$", "`$1" -replace "^(.*)\\.*$", "`$1"
## Windows Powershell
New-Item $PSUSERHOME\WindowsPowerShell -Force -ItemType Directory
## Powershell Core
New-Item $PSUSERHOME\PowerShell -Force -ItemType Directory

# vscode
New-Item $env:APPDATA\Code\User -Force -ItemType Directory

# Windows Terminal
New-Item -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -Force -ItemType Directory

# ssh
New-Item -Path $env:USERPROFILE\.ssh -Force -ItemType Directory

# runas
Start-Process powershell.exe ("-NoProfile -noexit -ExecutionPolicy Unrestricted -Command cd " + $env:USERPROFILE + "\.dotfiles; .\runas.ps1") -Verb runas

# install code extensions
$CODES = @()
if (Get-Command * | Where-Object { $_.Name -match "^Code.exe$" }) {
  $CODES += "code"
}

foreach ($CODE in $CODES) {
  foreach ($line in Get-Content $DOTFILES\.config\Code\extensions) {
    Invoke-Expression "$CODE --install-extension $line --force"
  }
  # uninstall code extensions
  foreach ($line in Get-Content $DOTFILES\.config\Code\x_extensions) {
    Invoke-Expression "$CODE --uninstall-extension $line --force"
  }
}

# gitconfig for windows
if (!(Test-Path -Path $env:USERPROFILE\.gitconfig.local)) {
  New-Item -Path $env:USERPROFILE\.gitconfig.local
}

# ghq
New-Item $env:USERPROFILE\src -Force -ItemType Directory

