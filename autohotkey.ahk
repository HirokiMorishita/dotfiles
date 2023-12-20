#Requires AutoHotkey v2.0-a
;----------Setting----------

Persistent()
#SingleInstance Force
#UseHook
InstallKeybdHook
InstallMouseHook
A_HotkeyInterval := 2000
A_MaxHotkeysPerInterval := 200
A_SendMode := "Input"
ProcessSetPriority "Realtime"
SetWorkingDir A_ScriptDir
SetTitleMatchMode 2
SetKeyDelay 20

;---------- Ctrl ----------
/**
 * エスケープ
 *
 * @hotkey Ctrl+{無変換}
 * @target デフォルト
 */
^vk1D::Send "{Esc}"
/**
 * コンテキストメニューを開く
 *
 * @hotkey Ctrl+{変換}
 * @target デフォルト
 */
^vk1C::Send "+{F10}"

/**
 * 半角英数に変換
 *
 * @hotkey Ctrl + Space
 * @target デフォルト
 */
^Space::Send "{F10}"
/**
 * エスケープ
 *
 * @hotkey Ctrl + [
 * @target デフォルト
 */
^[::Send "{Esc}"
;---------- 無変換キー ----------
vk1D::Return

/**
 * カーソルキー(左)
 *
 * @hotkey 無変換+{H}
 * @target デフォルト
 */
~vk1D & H::Send "{Blind}{Left}"
/**
 * カーソルキー(下)
 *
 * @hotkey 無変換+{J}
 * @target デフォルト
 */
vk1D & J::Send "{Blind}{Down}"
/**
 * カーソルキー(上)
 *
 * @hotkey 無変換+{K}
 * @target デフォルト
 */
vk1D & K::Send "{Blind}{Up}"
/**
 * カーソルキー(右)
 *
 * @hotkey 無変換+{L}
 * @target デフォルト
 */
vk1D & L::Send "{Blind}{Right}"

/**
 * Homeキー
 *
 * @hotkey 無変換+{Y}
 * @target デフォルト
 */
vk1D & Y::Send "{Blind}{Home}"
/**
 * Page Downキー
 *
 * @hotkey 無変換+{U}
 * @target デフォルト
 */
vk1D & U::Send "{Blind}{PgDn}"
/**
 * Page Upキー
 *
 * @hotkey 無変換+{I}
 * @target デフォルト
 */
vk1D & I::Send "{Blind}{PgUp}"
/**
 * Endキー
 *
 * @hotkey 無変換+{O}
 * @target デフォルト
 */
vk1D & O::Send "{Blind}{End}"

/**
 * ctrl + 左カーソルキー
 *
 * @hotkey 無変換+{N}
 * @target デフォルト
 */
vk1D & N::Send "{Blind}^{Left}"
/**
 * ctrl + 右カーソルキー
 *
 * @hotkey 無変換+{.}
 * @target デフォルト
 */
vk1D & .::Send "{Blind}^{Right}"

/**
 * リネーム
 *
 * @hotkey 無変換+{R}
 * @target デフォルト
 */
vk1D & R::Send "{Blind}{F2}"
/**
 * アドレスバーにフォーカス
 *
 * @hotkey 無変換+{T}
 * @target デフォルト
 */
vk1D & T::Send "{Blind}^{l}"

/**
 * 全選択
 *
 * @hotkey 無変換+{A}
 * @target デフォルト
 */
vk1D & A::Send "^{a}"
/**
 * 上書き保存
 *
 * @hotkey 無変換+{S}
 * @target デフォルト
 */
vk1D & S::Send "^{s}"
/**
 * 検索
 *
 * @hotkey 無変換+{F}
 * @target デフォルト
 */
vk1D & F::Send "{Blind}^{f}"

/**
 * アンドゥ
 *
 * @hotkey 無変換+{Z}
 * @target デフォルト
 */
vk1D & Z::Send "^{z}"
/**
 * 切り取り
 *
 * @hotkey 無変換+{X}
 * @target デフォルト
 */
vk1D & X::Send "^{x}"
/**
 * コピー
 *
 * @hotkey 無変換+{C}
 * @target デフォルト
 */
vk1D & C::Send "^{c}"
/**
 * 履歴から貼り付け
 *
 * @hotkey 無変換+{V}
 * @target デフォルト
 */
vk1D & V::Send "#{v}"
/**
 * ブックマーク
 *
 * @hotkey 無変換+{B}
 * @target デフォルト
 */
vk1D & B::Send "{Blind}^{b}"
/**
 * エスケープ
 *
 * @hotkey 無変換+{[}
 * @target デフォルト
 */
vk1D & [::Send "{Esc}"
/**
 * バックスペース
 *
 * @hotkey 無変換+{Space}
 * @target デフォルト
 */
vk1D & Space::Send "{BS}"

/**
 * 半角/全角
 *
 * @hotkey 無変換+変換
 * @target デフォルト
 */
vk1D & vk1C::Send "{vkF3sc029}"

;---------- 変換キー ----------
vk1C::Return

/**
 * 仮想デスクトップの切り替え(左)
 *
 * @hotkey 変換+{Y}
 * @target デフォルト
 */
vk1C & Y::Send "#^{Left}"
/**
 * ウィンドウの切り替え(左)
 *
 * @hotkey 変換+{U}
 * @target デフォルト
 */
vk1C & U::ShiftAltTab
/**
 * ウィンドウの切り替え(右)
 *
 * @hotkey 変換+{I}
 * @target デフォルト
 */
vk1C & I::AltTab
/**
 * 仮想デスクトップの切り替え(右)
 *
 * @hotkey 変換+{O}
 * @target デフォルト
 */
vk1C & O::Send "#^{Right}"

/**
 * 戻る
 *
 * @hotkey 変換+{H}
 * @target デフォルト
 */
vk1C & H::Send "!{Left}"
/**
 * タブの切り替え(左)
 *
 * @hotkey 変換+{J}
 * @target デフォルト
 */
vk1C & J::Send "^+{Tab}"
/**
 * タブの切り替え(右)
 *
 * @hotkey 変換+{K}
 * @target デフォルト
 */
vk1C & K::Send "^{Tab}"
/**
 * 進む
 *
 * @hotkey 変換+{L}
 * @target デフォルト
 */
vk1C & L::Send "!{Right}"


/**
 * ウィンドウ移動(左)
 *
 * @hotkey 変換+{N}
 * @target デフォルト
 */
vk1C & N::Send "{Blind}#{Left}"
/**
 * ウィンドウ移動(下)
 *
 * @hotkey 変換+{M}
 * @target デフォルト
 */
vk1C & M::Send "{Blind}#{Down}"
/**
 * ウィンドウ移動(上)
 *
 * @hotkey 変換+{,}
 * @target デフォルト
 */
vk1C & ,::Send "{Blind}#{Up}"
/**
 * ウィンドウ移動(右)
 *
 * @hotkey 変換+{.}
 * @target デフォルト
 */
vk1C & .::Send "{Blind}#{Right}"


/**
 * ウィンドウを閉じる
 *
 * @hotkey 変換+{Q}
 * @target デフォルト
 */
vk1C & Q::WinClose "A"
/**
 * タブを閉じる
 *
 * @hotkey 変換+{W}
 * @target デフォルト
 */
vk1C & W::Send "{Blind}^{w}"
/**
 * 閉じたタブを開く
 *
 * @hotkey 変換+{E}
 * @target デフォルト
 */
vk1C & E::Send "{Blind}^+{t}"
/**
 * リロード
 *
 * @hotkey 変換+{R}
 * @target デフォルト
 */
vk1C & R::Send "{Blind}{F5}"
/**
 * 新規タブを開く
 *
 * @hotkey 変換+{T}
 * @target デフォルト
 */
vk1C & T::Send "{Blind}^{t}"

/**
 * Chromeを開く
 *
 * @hotkey 変換+{A}
 * @target デフォルト
 */
vk1C & A::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"

/**
 * Slackを開く
 *
 * @hotkey 変換+{S}
 * @target デフォルト
 */
vk1C & S::Run "C:\Users\" . A_UserName . "\AppData\Local\slack\slack.exe"
/**
 * VSCodeを開く
 *
 * @hotkey 変換+{D}
 * @target デフォルト
 */
vk1C & D::Run "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
/**
 * 置換
 *
 * @hotkey 変換+{F}
 * @target デフォルト
 */
vk1C & F::Send "{Blind}^{h}"

/**
 * ターミナルを開く
 *
 * @hotkey 変換+{G}
 * @target デフォルト
 */
vk1C & G::Run "wt.exe"
/**
 * 仮想デスクトップ切り替え(左)
 *
 * @hotkey 変換+{Z}
 * @target デフォルト
 */
vk1C & Z::Send "{Blind}#^{Left}"
/**
 * 仮想デスクトップを閉じる
 *
 * @hotkey 変換+{X}
 * @target デフォルト
 */
vk1C & X::Send "{Blind}#^{F4}"
/**
 * 仮想デスクトップを開く
 *
 * @hotkey 変換+{C}
 * @target デフォルト
 */
vk1C & C::Send "{Blind}#^d"
/**
 * 仮想デスクトップ切り替え(右)
 *
 * @hotkey 変換+{V}
 * @target デフォルト
 */
vk1C & V::Send "{Blind}#^{Right}"

/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{1}
 * @target デフォルト
 */
vk1C & 1::Send "#!{1}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{2}
 * @target デフォルト
 */
vk1C & 2::Send "#!{2}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{3}
 * @target デフォルト
 */
vk1C & 3::Send "#!{3}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{4}
 * @target デフォルト
 */
vk1C & 4::Send "#!{4}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{5}
 * @target デフォルト
 */
vk1C & 5::Send "#!{5}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{6}
 * @target デフォルト
 */
vk1C & 6::Send "#!{6}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{7}
 * @target デフォルト
 */
vk1C & 7::Send "#!{7}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{8}
 * @target デフォルト
 */
vk1C & 8::Send "#!{8}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{9}
 * @target デフォルト
 */
vk1C & 9::Send "#!{9}"
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{0}
 * @target デフォルト
 */
vk1C & 0::Send "#!{0}"

/**
 * Delete
 *
 * @hotkey 変換+{Space}
 * @target デフォルト
 */
vk1C & Space::Send "{Delete}"

/**
 * 半角/全角
 *
 * @hotkey 変換+無変換
 * @target デフォルト
 */
vk1C & vk1D::Send "{vkF3sc029}"
;---------- LAlt ----------
/**
 * OCR (powertoys)
 *
 * @hotkey LAlt+{A}
 * @target デフォルト
 */
LAlt & A::Send "#+{T}"
/**
 * スクリーンショットをとる
 *
 * @hotkey LAlt+{S}
 * @target デフォルト
 */
LAlt & S::Send "#+{S}"

/**
 * ウィンドウのピン止め
 *
 * @hotkey LAlt+{Z}
 * @target デフォルト
 */
LAlt & Z::Send "#^{t}"
/**
 * ピクセル測定(powertoys)
 *
 * @hotkey LAlt+{X}
 * @target デフォルト
 */
LAlt & X::Send "#+{m}"
/**
 * カラーピッカー(powertoys)
 *
 * @hotkey LAlt+{C}
 * @target デフォルト
 */
LAlt & C::Send "#+{c}"
/**
 * DevToys
 *
 * @hotkey LAlt+{V}
 * @target デフォルト
 */
LAlt & V::Run "devtoys:"

/**
 * script のリロード
 *
 * @hotkey LAlt + 無変換
 * @target デフォルト
 */
LAlt & vk1D::Reload

;---------- アプリごとのショートカット ----------
;Slack
#HotIf WinActive("ahk_exe slack.exe")

  /**
  * ワークスペースの切り替え(下)
  *
  * @hotkey 変換 + {H}
  * @target Slack
  */
  vk1C & h::Send "^{Tab}"
  /**
  * チャンネルの切り替え(下)
  *
  * @hotkey 変換 + {J}
  * @target Slack
  */
  vk1C & j::Send "!+{Down}"
  /**
  * チャンネルの切り替え(上)
  *
  * @hotkey 変換 + {K}
  * @target Slack
  */
  vk1C & k::Send "!+{Up}"
  /**
  * ワークスペースの切り替え(上)
  *
  * @hotkey 変換 + {L}
  * @target Slack
  */
  vk1C & l::Send "^+{Tab}"
  /**
  * ブックマークを開く
  *
  * @hotkey 変換 + {B}
  * @target Slack
  */
  vk1C & b::Send "^+{S}"
  /**
  * チャンネルをブラウズする
  *
  * @hotkey 変換 + {F}
  * @target Slack
  */
  vk1C & f::Send "^+{L}"
#HotIf

;エクスプローラ
#HotIf WinActive("ahk_exe Explorer.EXE")
  /**
  * アドレスバーにフォーカス
  *
  * @hotkey Ctrl + {L}
  * @target エクスプローラ
  */
  ^L::Send "^{E}"

  /**
  * 親フォルダを開く
  *
  * @hotkey 変換 + {K}
  * @target エクスプローラ
  */
  vk1C & k::Send "!{Up}"
  /**
  * ナビゲーションに移動
  *
  * @hotkey 変換 + {j}
  * @target エクスプローラ
  */
  vk1C & j::Send "^{f}{Tab 2}"
#HotIf


;VSCode
#HotIf WinActive("ahk_exe Code.exe")
  ;---------- 無変換キー ----------

  /**
  * 最近開いたフォルダを開く
  *
  * @hotkey 無変換+{Q}
  * @target VSCode
  */
  vk1D & Q::Send "{Blind}^{r}"

  /**
  * コードを折りたたみ
  *
  * @hotkey 無変換+{W}
  * @target VSCode
  */
  vk1D & W::Send "{Blind}^+{[}"
  /**
  * ファイル選択
  *
  * @hotkey 無変換+{E}
  * @target VSCode
  */
  vk1D & E::Send "{Blind}^{e}"
  /**
  * リネーム
  *
  * @hotkey 無変換+{R}
  * @target VSCode
  */
  vk1D & R:: {
    Send "^{0}"
    Send "{Blind}{F2}"
  }

  /**
  * コードを展開
  *
  * @hotkey 無変換+{T}
  * @target VSCode
  */
  vk1D & T::Send "{Blind}^+{]}"

  /**
  * マルチカーソル(下)
  *
  * @hotkey 無変換+{M}
  * @target VSCode
  */
  vk1D & M::Send "{Blind}!^{Down}"
  /**
  * マルチカーソル(上)
  *
  * @hotkey 無変換+{,}
  * @target VSCode
  */
  vk1D & ,::Send "{Blind}!^{Up}"

  /**
  * スマート選択
  *
  * @hotkey 無変換+{D}
  * @target VSCode
  */
  vk1D & D::Send "{Blind}^{d}"
  /**
  * jumpy起動
  *
  * @hotkey 無変換+{G}
  * @target VSCode
  */
  vk1D & G::Send "{Blind}^{g}"

  /**
  * ターミナルにフォーカス
  *
  * @hotkey 無変換+{Enter}
  * @target VSCode
  */
  vk1D & Enter::Send "^+{Enter}"
  ;---------- 変換キー ----------

  /**
  * アンドゥ
  *
  * @hotkey 変換+{H}
  * @target VSCode
  */
  vk1C & H::Send "^{z}"
  /**
  * リドゥ
  *
  * @hotkey 変換+{L}
  * @target VSCode
  */
  vk1C & L::Send "^+{z}"
  /**
  * タブ切り替え(←)
  *
  * @hotkey 変換+{J}
  * @target VSCode
  */
  vk1C & J::Send "{Blind}^+{Tab}"
  /**
  * タブ切り替え(→)
  *
  * @hotkey 変換+{K}
  * @target VSCode
  */
  vk1C & K::Send "{Blind}^{Tab}"

  ;---------- LAltキー ----------
  /**
  * フォーカス移動(左)
  *
  * @hotkey LAlt + {H}
  * @target VSCode
  */
  LAlt & h::Send "!{h}"
  /**
  * フォーカス移動(下)
  *
  * @hotkey LAlt + {J}
  * @target VSCode
  */
  LAlt & j::Send "!{j}"
  /**
  * フォーカス移動(上)
  *
  * @hotkey LAlt + {K}
  * @target VSCode
  */
  LAlt & k::Send "!{k}"
  /**
  * フォーカス移動(右)
  *
  * @hotkey LAlt + {L}
  * @target VSCode
  */
  LAlt & l::Send "!{l}"

  /**
  * エディタ分割(→)
  *
  * @hotkey LAlt+{F}
  * @target VSCode
  */
  LAlt & f::Send "^+!{r}"
  /**
  * エディタ分割(↓)
  *
  * @hotkey LAlt+{D}
  * @target VSCode
  */
  LAlt & d::Send "^+!{d}"
#HotIf

;Kindle
#HotIf WinActive("ahk_exe Kindle.exe")
  /**
  * 位置Noに移動
  *
  * @hotkey 変換+{F}
  * @target Kindle
  */
  vk1C & f::Send "^{g}"
  /**
  * 前のページ
  *
  * @hotkey 変換+{H}
  * @target Kindle
  */
  vk1C & h::Send "{Blind}{Up}"
  /**
  * 目次を開く
  *
  * @hotkey 変換+{J}
  * @target Kindle
  */
  vk1C & j::Send "^{l}"
  /**
  * フルスクリーン
  *
  * @hotkey 変換+{K}
  * @target Kindle
  */
  vk1C & k::Send "{F11}"
  /**
  * 次のページ
  *
  * @hotkey 変換+{L}
  * @target Kindle
  */
  vk1C & l::Send "{Blind}{Down}"
#HotIf

;Windows Terminal
#HotIf WinActive("ahk_exe WindowsTerminal.exe")
  /**
  * 検索
  *
  * @hotkey 無変換+{F}
  * @target WindowsTerminal
  */
  vk1D & f::Send "^+{f}"
  /**
  * 貼り付け
  *
  * @hotkey 無変換+{V}
  * @target WindowsTerminal
  */
  vk1D & v::Send "^+{v}"
  /**
  * 選択モード
  *
  * @hotkey 無変換+{/}
  * @target WindowsTerminal
  */
  vk1D & /::Send "^+{m}"
  /**
  * シェルを選んでタブを開く
  *
  * @hotkey 変換+{T}
  * @target WindowsTerminal
  */
  vk1C & t::Send "^+{Space}"
  /**
  * タブを閉じる
  *
  * @hotkey 変換+{W}
  * @target WindowsTerminal
  */
  vk1C & w::Send "^+{w}"
  /**
  * フォーカス移動(左)
  *
  * @hotkey LAlt + {H}
  * @target WindowsTerminal
  */
  LAlt & h::Send "!{Left}"
  /**
  * フォーカス移動(下)
  *
  * @hotkey LAlt + {J}
  * @target WindowsTerminal
  */
  LAlt & j::Send "!{Down}"
  /**
  * フォーカス移動(上)
  *
  * @hotkey LAlt + {K}
  * @target WindowsTerminal
  */
  LAlt & k::Send "!{Up}"
  /**
  * フォーカス移動(右)
  *
  * @hotkey LAlt + {L}
  * @target WindowsTerminal
  */
  LAlt & l::Send "!{Right}"
  /**
  * エディタ分割(→)
  *
  * @hotkey LAlt+{F}
  * @target WindowsTerminal
  */
  LAlt & f::Send "^+!{r}"
  /**
  * エディタ分割(↓)
  *
  * @hotkey LAlt+{D}
  * @target WindowsTerminal
  */
  LAlt & d::Send "^+!{d}"
#HotIf


;chrome
#HotIf WinActive("ahk_exe chrome.exe")

  /**
  * ブックマーク追加
  *
  * @hotkey 変換+{B}
  * @target Chrome
  */
  vk1C & B::Send "^{d}"
#HotIf


/**
 * 設定されたホットキー/ホットストリングを一覧表示
 *
 * @hotkey 無変換+{P}
 * @target デフォルト
 */
vk1D & P:: {
  If not WinExist("AutoHotkey設定一覧") {
    HotKeyHelpGui()
  }
  Else {
    WinActivate
  }
}

class HotKeyHelpGui {
  __New() {
    this.Gui := Gui("+Resize","AutoHotkey設定一覧",this)
    this.Tab := this.Gui.Add("Tab3", "VsTab W700 H400", ["ホットキー"])
    this.Tab.UseTab(1)
    this.TreeView := this.Gui.Add("TreeView","W120 H360")
    this.TreeView.Add("全てのホットキー", 0, "Expand")
    this.ListView := this.Gui.Add("ListView", "X+5 W550 H360 Grid ReadOnly", ["対象","説明","ホットキー"])
    this.ListView.ModifyCol(1, 100)
    this.ListView.ModifyCol(2, 250)
    this.ListView.ModifyCol(3, 145)
    this.Gui.Show()

    this.TreeView.OnEvent("ItemSelect", "__TreeViewSelected")
    this.TreeView.OnEvent("Focus", "__TreeViewSelected")
    this.Gui.OnEvent("Escape", "__Destroy")
    this.Gui.OnEvent("Close", "__Destroy")
    this.__TreeViewSelected()
  }
  __Destroy(*) {
    this.Gui.Destroy()
  }

  __TreeViewSelected(*) {
    this.ListView.Delete()
    ;ドキュメンテーションブロック判定フラグ
    vIsDoc := False
    Loop Read A_ScriptFullPath {
      If (RegExMatch(A_LoopReadLine, "^[\s|\t]*/\*\*[\s|\t]*")) {
        ;ドキュメンテーション開始(/**)
        vIsDoc := True

        ;変数を初期化
        vCommand := ""
        vHotkey := ""
        vTarget := ""
        vDesc := ""

        Continue
      }
      If (not vIsDoc) {
        Continue
      }
      ;ドキュメンテーションブロックの場合のみ読み込み
      If (RegExMatch(A_LoopReadLine, "\*[\s|\t]*@hotkey[\s|\t]*")) {
        ;ホットキーコメント( * @hotkey)
        If RegExMatch(A_LoopReadLine, "(?<=@hotkey[\s|\t]).*$", &vCommand) {
          vCommand := Trim(vCommand[0])
        }

        ;ホットキーコメントが複数あった場合、改行で区切って格納
        vHotkey := vHotkey == "" ? vCommand : vHotkey . "`r`n" . vCommand
      }
      Else If (RegExMatch(A_LoopReadLine, "\*[\s|\t]*@target[\s|\t]*")) {
        ;対象コメント( * @target)
        If RegExMatch(A_LoopReadLine, "(?<=@target[\s|\t]).*$", &vTarget) {
          vTarget := Trim(vTarget[0])
        }
      }
      Else If (RegExMatch(A_LoopReadLine, "\*[\s|\t]*@.+[\s|\t]*")) {
        ;上記以外のドキュメンテーションタグは読み飛ばす( * @hogehoge)
        Continue
      }
      Else {
        ;それ以外はディスクリプションコメント( * )
        pos := RegExMatch(A_LoopReadLine, "(?<=\*[\s|\t]).*$", &vText)
        vDesc := pos == 0 ? vDesc : vDesc . "`r`n" . vText[0]
      }
      If (RegExMatch(A_LoopReadLine, "^[\s|\t]*\*/[\s|\t]*")) {
        ;ドキュメンテーション終了( */)
        vIsDoc := False
        ItemId := this.TreeView.GetNext()
        vTargetTreeId := ""
        Loop this.TreeView.GetCount() {
          ItemText := this.TreeView.GetText(ItemId)
          If (ItemText == vTarget) {
            ;ツリーの項目名称に存在した場合、ループ処理を終了
            vTargetTreeId := ItemId
            Break
          }
          ItemId := this.TreeView.GetNext(ItemId, "Full")
        }
        If (vTargetTreeId == "") {
          ;ツリーの項目名称に存在しない場合、ツリーに項目を追加
          vTargetTreeId := this.TreeView.Add(vTarget, this.TreeView.GetNext())
        }

        vCurrentTree := this.TreeView.GetSelection()
        Loop Parse, vHotkey, "`r", "`n" {
          If (this.TreeView.GetText(vCurrentTree) == "全てのホットキー" || vCurrentTree == vTargetTreeId) {
            ;"全てのホットキー"選択中または読み込み対象が選択中のターゲットと一致する場合、リストビューに追加
            this.ListView.Add("Col1", vTarget, vDesc, A_LoopField)
          }
        }
      }
    }
    Else {
      MsgBox "スクリプトファイル読み込みでエラーが発生しました。" A_Index "行目"
    }
  }
}