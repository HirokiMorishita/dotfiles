
# dotfiles
windowsのセットアップを行うdotfiles。

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

## 参考にしたURL
https://qiita.com/kentac55/items/733bdc21e66b44904332