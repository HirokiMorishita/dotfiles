alts=(
  "bat"  # cat
  "colordiff"  # diff
  "dfc"  # df
  #"exa"  # ls wslではデフォルトのUBUNTUのバージョンが低くaptで入らない
  "fd-find"  # find
  "htop"  # top
  "mtr"  # traceroute
  "ncdu"  # du
  "neovim"  # vim
  #"procs"  # ps aptにないのでbrewで入れる
  #"ripgrep"  # grep aptではエラーが出るのでbrewで入れる
  #"sd"  # sed aptにないのでbrewで入れる
)
alts_arch=(
  "${alts[@]}"
)
utils=(
  "curl"
  "git"
  "ssh"
  "tree"
  "unzip"
  "wget"
  "fzf"
  "make"
  "expect"
)
utils_arch=(
  "${utils[@]}"
)
