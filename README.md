
# dotfiles

## usage
### windows
```
git clone ${url} ~/.dotfiles
powershell -ExecutionPolicy Unrestricted ./make.ps1
```
### wsl
```
ln -s /mnt/c/Users/$(powershell.exe '$env:UserName')/.dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```