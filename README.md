
# dotfiles
windowsのセットアップを行うdotfiles。

## usage
### windows
```
git -C $HOME clone git@github.com:HirokiMorishita/dotfiles.git .dotfiles
powershell -ExecutionPolicy Unrestricted ./make.ps1
```
### wsl
```
ln -s $(wslpath "$(wslvar USERPROFILE)")/.dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## 参考にしたURL
https://qiita.com/kentac55/items/733bdc21e66b44904332
https://qiita.com/draganmaistir/items/36bd90fa6c5a93736c70