fsutil 8dot3name set 1
$DOTFILES = "$env:USERPROFILE\.dotfiles"
$PSUSERHOME = $profile -replace "^(.*)\\.*$", "`$1" -replace "^(.*)\\.*$", "`$1"

Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1

switch ((Get-WmiObject -Class Win32_ComputerSystem).Model) {
  "Virtual Machine" {
    $isVM = $true
  }
  "VMware Virtual Platform" {
    $isVM = $true
  }
  "VirtualBox" {
    $isVM = $true
  }
  default {
    $isVM = $false
  }
}

$enableFeatures = @()
$disableFeatures = @(
  # "WorkFolders-Client"
)
if (! $isVM) {
  $virtualizationFeatures = @(
    "Containers"
    "Microsoft-Hyper-V"
    "Microsoft-Windows-Subsystem-Linux"
    "HypervisorPlatform"
    "VirtualMachinePlatform"
  )
  $enableFeatures += $virtualizationFeatures
}

foreach ($enableFeature in $enableFeatures) {
  if ((Get-WindowsOptionalFeature -Online -FeatureName $enableFeature).State -eq "Disabled") {
    Write-Output "Try to enable $enableFeature"
    Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName $enableFeature
  }
  else {
    Write-Output "$enableFeature has been already enabled"
  }
}

foreach ($disableFeature in $disableFeatures) {
  if ((Get-WindowsOptionalFeature -Online -FeatureName $disableFeature).State -eq "Enabled") {
    Write-Output "Try to disable $disableFeature"
    Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName $disableFeature
  }
  else {
    Write-Output "$disableFeature has been already disabled"
  }
}

# 権限が必要みたいなので管理者権限でインストール
scoop install firacode

# editorconfig
New-Item -Force -ItemType SymbolicLink -Path $env:USERPROFILE\.editorconfig -Value $DOTFILES\.editorconfig

# git
New-Item -Force -ItemType SymbolicLink -Path $env:USERPROFILE\.gitconfig -Value $DOTFILES\.gitconfig
New-Item -Force -ItemType SymbolicLink -Path $env:USERPROFILE\.gitmessage -Value $DOTFILES\.gitmessage

# code
New-Item -Force -ItemType SymbolicLink -Path $env:APPDATA\Code\User\settings.json -Value $DOTFILES\.config\Code\User\settings.json
New-Item -Force -ItemType SymbolicLink -Path $env:APPDATA\Code\User\keybindings.json -Value $DOTFILES\.config\Code\User\keybindings.json
New-Item -Force -ItemType SymbolicLink -Path $env:APPDATA\Code\User\snippets\common.code-snippets -Value $DOTFILES\.config\Code\User\snippets\common.code-snippets

# Windows Terminal
New-Item -Force -ItemType SymbolicLink -Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Value $DOTFILES\.config\WindowsTerminal\LocalState\settings.json

# autohotkey
cmd.exe /C 'assoc .ahk=AutoHotKey'
cmd.exe /C 'ftype AutoHotKey=%USERPROFILE%\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe %1'
New-Item -Force -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\autohotkey.ahk" -Value $DOTFILES\autohotkey.ahk

# ssh-agent for using ssh from devcontainer
Set-Service ssh-agent -StartupType Automatic
Start-Service ssh-agent
Get-Service ssh-agent

# ctrl2cap
Push-Location "$env:USERPROFILE\scoop\apps\ctrl2cap\current"
ctrl2cap.exe /install
Pop-Location

wsl --install -d Ubuntu-20.04
wsl --update
wsl --shutdown

Start-Sleep -Seconds 5
