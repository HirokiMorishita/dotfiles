﻿;----------Setting----------

#Persistent
#SingleInstance, Force
#NoEnv
#UseHook
#InstallKeybdHook
#InstallMouseHook
#HotkeyInterval, 2000
#MaxHotkeysPerInterval, 200
Process, Priority,, Realtime
SendMode, Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2


;---------- 無変換キー ----------
vk1D::Return

/**
 * カーソルキー(左)
 *
 * @hotkey 無変換+{H}
 * @target デフォルト
 */
~vk1D & H::Send,{Blind}{Left}
/**
 * カーソルキー(下)
 *
 * @hotkey 無変換+{J}
 * @target デフォルト
 */
vk1D & J::Send,{Blind}{Down}
/**
 * カーソルキー(上)
 *
 * @hotkey 無変換+{K}
 * @target デフォルト
 */
vk1D & K::Send,{Blind}{Up}
/**
 * カーソルキー(右)
 *
 * @hotkey 無変換+{L}
 * @target デフォルト
 */
vk1D & L::Send,{Blind}{Right}

/**
 * Homeキー
 *
 * @hotkey 無変換+{Y}
 * @target デフォルト
 */
vk1D & Y::Send,{Blind}{Home}
/**
 * Page Downキー
 *
 * @hotkey 無変換+{U}
 * @target デフォルト
 */
vk1D & U::Send,{Blind}{PgDn}
/**
 * Page Upキー
 *
 * @hotkey 無変換+{I}
 * @target デフォルト
 */
vk1D & I::Send,{Blind}{PgUp}
/**
 * Endキー
 *
 * @hotkey 無変換+{O}
 * @target デフォルト
 */
vk1D & O::Send,{Blind}{End}

/**
 * ctrl + 左カーソルキー
 *
 * @hotkey 無変換+{N}
 * @target デフォルト
 */
vk1D & N::Send,{Blind}^{Left}
/**
 * ctrl + 右カーソルキー
 *
 * @hotkey 無変換+{.}
 * @target デフォルト
 */
vk1D & .::Send,{Blind}^{Right}

/**
 * リネーム
 *
 * @hotkey 無変換+{R}
 * @target デフォルト
 */
vk1D & R::Send, {Blind}{F2}
/**
 * アドレスバーにフォーカス
 *
 * @hotkey 無変換+{T}
 * @target デフォルト
 */
vk1D & T::Send, {Blind}^{l}

/**
 * 全選択
 *
 * @hotkey 無変換+{A}
 * @target デフォルト
 */
vk1D & A::Send, {Blind}^{a}
/**
 * 上書き保存
 *
 * @hotkey 無変換+{S}
 * @target デフォルト
 */
vk1D & S::Send, {Blind}^{s}
/**
 * 検索
 *
 * @hotkey 無変換+{F}
 * @target デフォルト
 */
vk1D & F::Send, {Blind}^{f}

/**
 * アンドゥ
 *
 * @hotkey 無変換+{Z}
 * @target デフォルト
 */
vk1D & Z::Send, {Blind}^{z}
/**
 * 切り取り
 *
 * @hotkey 無変換+{X}
 * @target デフォルト
 */
vk1D & X::Send, {Blind}^{x}
/**
 * コピー
 *
 * @hotkey 無変換+{C}
 * @target デフォルト
 */
vk1D & C::Send, {Blind}^{c}
/**
 * 貼り付け
 *
 * @hotkey 無変換+{V}
 * @target デフォルト
 */
vk1D & V::Send, {Blind}#{v}
/**
 * ブックマーク
 *
 * @hotkey 無変換+{B}
 * @target デフォルト
 */
vk1D & B::Send, {Blind}^{b}
/**
 * エスケープ
 *
 * @hotkey 無変換+{[}
 * @target デフォルト
 */
vk1D & [::Send, {Esc}
/**
 * バックスペース
 *
 * @hotkey 無変換+{Space}
 * @target デフォルト
 */
vk1D & Space::Send, {BS}
/**
 * 半角/全角
 *
 * @hotkey 無変換+変換
 * @target デフォルト
 */
vk1D & vk1C::Send, {vkF3sc029}

;---------- 変換キー ----------
vk1C::Return

/**
 * 仮想デスクトップの切り替え(左)
 *
 * @hotkey 変換+{Y}
 * @target デフォルト
 */
~vk1C & Y::Send, #^{Left}
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
vk1C & O::Send, #^{Right}

/**
 * 戻る
 *
 * @hotkey 変換+{H}
 * @target デフォルト
 */
vk1C & H::Send, !{Left}
/**
 * タブの切り替え(左)
 *
 * @hotkey 変換+{J}
 * @target デフォルト
 */
vk1C & J::Send, ^+{Tab}
/**
 * タブの切り替え(右)
 *
 * @hotkey 変換+{K}
 * @target デフォルト
 */
vk1C & K::Send, ^{Tab}
/**
 * 進む
 *
 * @hotkey 変換+{L}
 * @target デフォルト
 */
vk1C & L::Send, !{Right}


/**
 * ウィンドウ移動(左)
 *
 * @hotkey 変換+{N}
 * @target デフォルト
 */
vk1C & N::Send, #{Left}
/**
 * ウィンドウ移動(下)
 *
 * @hotkey 変換+{M}
 * @target デフォルト
 */
vk1C & M::Send, #{Down}
/**
 * ウィンドウ移動(上)
 *
 * @hotkey 変換+{,}
 * @target デフォルト
 */
vk1C & ,::Send, #{Up}
/**
 * ウィンドウ移動(右)
 *
 * @hotkey 変換+{.}
 * @target デフォルト
 */
vk1C & .::Send, #{Right}


/**
 * ウィンドウを閉じる
 *
 * @hotkey 変換+{Q}
 * @target デフォルト
 */
vk1C & Q::WinClose,A
/**
 * タブを閉じる
 *
 * @hotkey 変換+{W}
 * @target デフォルト
 */
vk1C & W::Send, {Blind}^{w}
/**
 * Windows検索
 *
 * @hotkey 変換+{E}
 * @target デフォルト
 */
vk1C & E::Send, #{s}
/**
 * リロード
 *
 * @hotkey 変換+{R}
 * @target デフォルト
 */
vk1C & R::Send, {Blind}{F5}
/**
 * 新規タブを開く
 *
 * @hotkey 変換+{T}
 * @target デフォルト
 */
vk1C & T::Send, {Blind}^{t}

/**
 * スクリーンショットをとる
 *
 * @hotkey 変換+{S}
 * @target デフォルト
 */
vk1C & S::Send, #+{S}
/**
 * ショートカットメニューを表示する
 *
 * @hotkey 変換+{D}
 * @target デフォルト
 */
vk1C & D::Send, {Blind}+{F10}
/**
 * 置換
 *
 * @hotkey 変換+{F}
 * @target デフォルト
 */
vk1C & F::Send, {Blind}^{h}

/**
 * 仮想デスクトップ切り替え(左)
 *
 * @hotkey 変換+{Z}
 * @target デフォルト
 */
vk1C & Z::Send, {Blind}#^{Left}
/**
 * 仮想デスクトップを閉じる
 *
 * @hotkey 変換+{X}
 * @target デフォルト
 */
vk1C & X::Send, {Blind}#^{F4}
/**
 * 仮想デスクトップを開く
 *
 * @hotkey 変換+{C}
 * @target デフォルト
 */
vk1C & C::Send, {Blind}#^d
/**
 * 仮想デスクトップ切り替え(右)
 *
 * @hotkey 変換+{V}
 * @target デフォルト
 */
vk1C & V::Send, {Blind}#^{Right}

/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{1}
 * @target デフォルト
 */
vk1C & 1::Send, #!{1}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{2}
 * @target デフォルト
 */
vk1C & 2::Send, #!{2}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{3}
 * @target デフォルト
 */
vk1C & 3::Send, #!{3}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{4}
 * @target デフォルト
 */
vk1C & 4::Send, #!{4}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{5}
 * @target デフォルト
 */
vk1C & 5::Send, #!{5}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{6}
 * @target デフォルト
 */
vk1C & 6::Send, #!{6}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{7}
 * @target デフォルト
 */
vk1C & 7::Send, #!{7}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{8}
 * @target デフォルト
 */
vk1C & 8::Send, #!{8}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{9}
 * @target デフォルト
 */
vk1C & 9::Send, #!{9}
/**
 * タスクバーのピン止めメニューを開く
 *
 * @hotkey 変換+{0}
 * @target デフォルト
 */
vk1C & 0::Send, #!{0}

/**
 * Delete
 *
 * @hotkey 変換+{Space}
 * @target デフォルト
 */
vk1C & Space::Send, {Delete}
;---------- LAlt ----------
;LAlt::Return

/**
 * -
 *
 * @hotkey LAlt + {Y}
 * @target デフォルト
 */
LAlt & y::Send, {-}
/**
 * /
 *
 * @hotkey LAlt + {u}
 * @target デフォルト
 */
LAlt & u::Send, {/}
/**
 * *
 *
 * @hotkey LAlt + {I}
 * @target デフォルト
 */
LAlt & i::Send, {*}
/**
 * +
 *
 * @hotkey LAlt + {O}
 * @target デフォルト
 */
LAlt & o::Send, {+}
/**
 * %
 *
 * @hotkey LAlt + {P}
 * @target デフォルト
 */
LAlt & p::Send, {`%}

/**
 * !
 *
 * @hotkey LAlt + {H}
 * @target デフォルト
 */
LAlt & h::Send, {!}
/**
 * (
 *
 * @hotkey LAlt + {J}
 * @target デフォルト
 */
LAlt & j::Send, {(}
/**
 * )
 *
 * @hotkey LAlt + {K}
 * @target デフォルト
 */
LAlt & k::Send, {)}
/**
 * =
 *
 * @hotkey LAlt + {L}
 * @target デフォルト
 */
LAlt & l::Send, {=}

/**
 * |
 *
 * @hotkey LAlt + {N}
 * @target デフォルト
 */
LAlt & n::Send, {|}
/**
 * [
 *
 * @hotkey LAlt + {M}
 * @target デフォルト
 */
LAlt & m::Send, {[}
/**
 * ]
 *
 * @hotkey LAlt + {,}
 * @target デフォルト
 */
LAlt & ,::Send, {]}
/**
 * &
 *
 * @hotkey LAlt + {.}
 * @target デフォルト
 */
LAlt & .::Send, {&}

/**
 * script のリロード
 *
 * @hotkey LAlt + 無変換
 * @target デフォルト
 */
LAlt & vk1D::Reload
;---------- Ctrl ----------

/**
 * 半角英数に変換
 *
 * @hotkey Ctrl + Space
 * @target デフォルト
 */
^Space::Send, {F10}
/**
 * エスケープ
 *
 * @hotkey Ctrl + [
 * @target デフォルト
 */
^[::Send, {Esc}

;---------- アプリごとのショートカット ----------
;Slack
#IfWinActive,ahk_exe slack.exe

/**
 * ワークスペースの切り替え(下)
 *
 * @hotkey 変換 + {H}
 * @target Slack
 */
vk1C & h::Send, ^{Tab}
/**
 * チャンネルの切り替え(下)
 *
 * @hotkey 変換 + {J}
 * @target Slack
 */
vk1C & j::Send, !+{Down}
/**
 * チャンネルの切り替え(上)
 *
 * @hotkey 変換 + {K}
 * @target Slack
 */
vk1C & k::Send, !+{Up}
/**
 * ワークスペースの切り替え(上)
 *
 * @hotkey 変換 + {L}
 * @target Slack
 */
vk1C & l::Send, ^+{Tab}
/**
 * ブックマークを開く
 *
 * @hotkey 変換 + {B}
 * @target Slack
 */
vk1C & b::Send, ^+{S}
/**
 * チャンネルをブラウズする
 *
 * @hotkey 変換 + {F}
 * @target Slack
 */
vk1C & f::Send, ^+{L}

#IfWinActive

;エクスプローラ
#IfWinActive,ahk_exe Explorer.EXE

/**
 * アドレスバーにフォーカス
 *
 * @hotkey Ctrl + {L}
 * @target エクスプローラ
 */
^L::Send, ^{E}

/**
 * 親フォルダを開く
 *
 * @hotkey 変換 + {J}
 * @target エクスプローラ
 */
vk1C & J::Send, !{Up}

#IfWinActive

;VSCode
#IfWinActive,ahk_exe Code.exe


;---------- 無変換キー ----------


/**
 * コードを折りたたみ
 *
 * @hotkey 無変換+{W}
 * @target VSCode
 */
vk1D & W::Send, {Blind}^+{[}

/**
 * コードを展開
 *
 * @hotkey 無変換+{T}
 * @target VSCode
 */
vk1D & T::Send, {Blind}^+{]}

/**
 * 行入れ替え(下)
 *
 * @hotkey 無変換+{M}
 * @target VSCode
 */
vk1D & M::Send,{Blind}!{Down}
/**
 * 行入れ替え(上)
 *
 * @hotkey 無変換+{,}
 * @target VSCode
 */
vk1D & ,::Send,{Blind}!{Up}
/**
 * ファイル選択
 *
 * @hotkey 無変換+{E}
 * @target VSCode
 */
vk1D & E::Send, {Blind}^{e}

/**
 * スマート選択
 *
 * @hotkey 無変換+{D}
 * @target VSCode
 */
vk1D & D::Send, {Blind}^{d}
/**
 * jumpy起動
 *
 * @hotkey 無変換+{G}
 * @target VSCode
 */
vk1D & G::Send, {Blind}^{g}

/**
 * リネーム
 *
 * @hotkey 無変換+{R}
 * @target VSCode
 */
vk1D & R::
Send, ^{0}
Send, {Blind}{F2}
Return

/**
 * ターミナルにフォーカス
 *
 * @hotkey 無変換+{Enter}
 * @target VSCode
 */
vk1D & Enter::Send, ^+{Enter}
;---------- 変換キー ----------

/**
 * アンドゥ
 *
 * @hotkey 変換+{H}
 * @target VSCode
 */
vk1C & H::Send, ^{z}
/**
 * リドゥ
 *
 * @hotkey 変換+{L}
 * @target VSCode
 */
vk1C & L::Send, ^+{z}
/**
 * タブ切り替え
 *
 * @hotkey 変換+{K}
 * @target VSCode
 */
vk1C & K::
SetKeyDelay -1
Send {Blind}{LCtrl Down}
Send, {Tab}
Return

vk1C up::
SetKeyDelay -1
Send {Blind}{LCtrl Up}
Return

;---------- LAltキー ----------
/**
 * サイドバーに移動
 *
 * @hotkey LAlt+{Space}
 * @target VSCode
 */
LAlt & Space::Send, ^{0}
/**
 * エディタに移動
 *
 * @hotkey LAlt+{変換}
 * @target VSCode
 */
LAlt & vk1C::Send, ^{1}

/**
 * エディタグループ移動[デフォルト]
 *
 * @hotkey Ctrl+{1,2,3...}
 * @target VSCode
 */
#IfWinActive


;Kindle
#IfWinActive,ahk_exe Kindle.exe

/**
 * 位置Noに移動
 *
 * @hotkey 変換+{F}
 * @target Kindle
 */
vk1C & f::Send, ^{g}
/**
 * 前のページ
 *
 * @hotkey 変換+{H}
 * @target Kindle
 */
vk1C & h::Send, {Blind}{Up}
/**
 * 目次を開く
 *
 * @hotkey 変換+{L}
 * @target Kindle
 */
vk1C & j::Send, ^{l}
/**
 * フルスクリーン
 *
 * @hotkey 変換+{K}
 * @target Kindle
 */
vk1C & k::Send, {F11}
/**
 * 次のページ
 *
 * @hotkey 変換+{L}
 * @target Kindle
 */
vk1C & l::Send, {Blind}{Down}

#IfWinActive


;Windows Terminal
#IfWinActive,ahk_exe WindowsTerminal.exe

/**
 * シェルを選んでタブを開く
 *
 * @hotkey 変換+{T}
 * @target WindowsTerminal
 */
vk1C & t::Send, ^+{Space}
/**
 * タブを閉じる
 *
 * @hotkey 変換+{W}
 * @target WindowsTerminal
 */
vk1C & w::Send, ^+{w}

#IfWinActive


/**
 * AutoHotkey設定一覧を表示する。
 */
HotkeyHelp()
{
    ;GUIの値格納変数
    Static sTab
    Static sHotkeyTree
    Static sHotkeyList
    Static sHotstrTree
    Static sHotstrList

    ;GUIのウィンドウハンドル
    Static sHwndTab
    Static sHwndHotkeyTree
    Static sHwndHotkeyList
    Static sHwndHotstrTree
    Static sHwndHotstrList

    ;ホットキーヘルプのGUIを作成
    Gui, HotkeyHelp:New, , AutoHotkey設定一覧

    ;タブを追加
    Gui, HotkeyHelp:Add, Tab2, HwndsHwndTab VsTab W700 H400, ホットキー|ホットストリング

    ;1つ目のタブを選択
    Gui, Tab, 1

    ;1つ目のタブにツリービューを追加
    Gui, HotkeyHelp:Add, TreeView, HwndsHwndHotkeyTree VsHotkeyTree GSelectTree W120 H360,
    TV_Add("全てのホットキー", 0, "Expand")

    ;1つ目のタブにリストビューを追加
    Gui, HotkeyHelp:Add, ListView, HwndsHwndHotkeyList VsHotkeyList X+5 W550 H360 Grid ReadOnly, 対象|ホットキー|条件|説明|

    ;リストビューの項目幅を設定
    LV_ModifyCol(1, 100)
    LV_ModifyCol(2, 145)
    LV_ModifyCol(3, 90)
    LV_ModifyCol(4, 350)

    ;2つ目のタブを選択
    Gui, Tab, 2

    ;2つ目のタブにツリービューを追加
    Gui, HotkeyHelp:Add, TreeView, HwndsHwndHotstrTree VsHotstrTree GSelectTree W120 H360,
    TV_Add("全てのホットストリング", 0, "Expand")

    ;2つ目のタブにリストビューを追加
    Gui, HotkeyHelp:Add, ListView, HwndsHwndHotstrList VsHotstrList X+5 W550 H360 Grid ReadOnly, 対象|ホットストリング|条件|説明

    ;リストビューの項目幅を設定
    LV_ModifyCol(1, 100)
    LV_ModifyCol(2, 145)
    LV_ModifyCol(3, 90)
    LV_ModifyCol(4, 350)

    ;GUIの表示
    Gui, HotkeyHelp:Show

    /**
    * ツリーアイテム選択時の動作。
    */
    SelectTree:
        ;シングルクリックの場合のみリストビューを更新
        If (A_GuiEvent == "S")
        {
            ;選択中のタブを取得
            GuiControlGet, vCurrentTab, , %sHwndTab%,

            If (vCurrentTab == "ホットキー")
            {
                ;ホットキータブの場合、ホットキーのツリービューとリストビューを選択
                Gui, TreeView, %sHwndHotkeyTree%
                Gui, ListView, %sHwndHotkeyList%

                ;リスト項目を全削除
                Gui, ListView, %sHwndHotkeyList%
                LV_Delete()
            }

            If (vCurrentTab == "ホットストリング")
            {
                ;ホットストリングタブの場合、ホットストリングのツリービューとリストビューを選択
                Gui, TreeView, %sHwndHotstrTree%
                Gui, ListView, %sHwndHotstrList%

                ;リスト項目を全削除
                Gui, ListView, %sHwndHotstrList%
                LV_Delete()
            }

            ;先頭のツリーアイテムを取得
            vTreeTop := TV_GetNext()

            ;選択中のツリーアイテムを取得
            vCurrentTree := TV_GetSelection()

            ;ドキュメンテーションブロック判定フラグ
            vIsDoc := False

            ;スクリプトファイル読み込み
            Loop, Read, %A_ScriptFullPath%
            {
                If (ErrorLevel)
                {
                    ;エラーの場合はバルーンメッセージを表示して終了
                    TrayTip, AutoHotkey, スクリプトファイル読み込みでエラーが発生しました。`r`n%A_Index%行目 %ErrorLevel%, 1, 18
                    Break
                }

                If (A_LoopReadLine == "/**") {
                    ;ドキュメンテーション開始(/**)
                    vIsDoc := True

                    ;変数を初期化
                    vCommand := ""
                    vHotkey := ""
                    vHotstr := ""
                    vTarget := ""
                    vCondition := ""
                    vDesc := ""

                    Continue
                }

                If (vIsDoc) {
                    ;ドキュメンテーションブロックの場合のみ読み込み
                    If (RegExMatch(A_LoopReadLine, "^\s\*[\s|\t]*@hotkey[\s|\t]*"))
                    {
                        ;ホットキーコメント( * @hotkey)
                        RegExMatch(A_LoopReadLine, "(?<=@hotkey[\s|\t]).*$", vCommand)
                        vCommand := Trim(vCommand)

                        ;ホットキーコメントが複数あった場合、改行で区切って格納
                        vHotkey := vHotkey == "" ? vCommand : vHotkey . "`r`n" . vCommand
                    }
                    Else If (RegExMatch(A_LoopReadLine, "\s\*[\s|\t]*@hotstr[\s|\t]*"))
                    {
                        ;ホットストリングコメント( * @hotstr)
                        RegExMatch(A_LoopReadLine, "(?<=@hotstr[\s|\t]).*$", vCommand)
                        vCommand := Trim(vCommand)

                        ;ホットストリングコメントが複数あった場合、改行で区切って格納
                        vHotstr := vHotstr == "" ? vCommand : vHotstr . "`r`n" . vCommand
                    }
                    Else If (RegExMatch(A_LoopReadLine, "\s\*[\s|\t]*@target[\s|\t]*"))
                    {
                        ;対象コメント( * @target)
                        RegExMatch(A_LoopReadLine, "(?<=@target[\s|\t]).*$", vTarget)
                        vTarget := Trim(vTarget)
                    }
                    Else If (RegExMatch(A_LoopReadLine, "\s\*[\s|\t]*@condition[\s|\t]*"))
                    {
                        ;条件コメント( * @condition)
                        RegExMatch(A_LoopReadLine, "(?<=@condition[\s|\t]).*$", vCondition)
                        vCondition := Trim(vCondition)
                    }
                    Else If (RegExMatch(A_LoopReadLine, "\s\*[\s|\t]*@.+[\s|\t]*"))
                    {
                        ;上記以外のドキュメンテーションタグは読み飛ばす( * @hogehoge)
                        Continue
                    }
                    Else
                    {
                        ;それ以外はディスクリプションコメント( * )
                        RegExMatch(A_LoopReadLine, "(?<=\*[\s|\t]).*$", vText)
                        If (vText != "")
                        {
                            vDesc := vDesc . vText
                        }
                    }

                    If (A_LoopReadLine == " */") {
                        ;ドキュメンテーション終了( */)
                        vIsDoc := False

                        ;ツリーアイテムを追加
                        If (vHotkey != "")
                        {
                            ;@hotkey行が存在していた場合、ツリービューとリストビューを選択
                            Gui, TreeView, %sHwndHotkeyTree%
                            Gui, ListView, %sHwndHotkeyList%

                            ;ツリーの先頭項目を取得
                            vTreeItemId := TV_GetNext()

                            ;読み込み行のツリーアイテムID
                            vTargetTreeId := ""

                            ;ツリーの項目数分ループ
                            Loop, % TV_GetCount()
                            {
                                ;ツリーの項目名称を取得
                                TV_GetText(vTreeText, vTreeItemId)
                                If (vTreeText == vTarget)
                                {
                                    ;ツリーの項目名称に存在した場合、ループ処理を終了
                                    vTargetTreeId := vTreeItemId
                                    Break
                                }

                                ;ツリーの項目名称に存在しない場合、次のツリー項目を取得しループを継続
                                vTreeItemId := TV_GetNext(vTreeItemId, "Full")
                            }

                            If (!vTargetTreeId)
                            {
                                ;ツリーの項目名称に存在しない場合、ツリーに項目を追加
                                vTargetTreeId := TV_Add(vTarget, TV_GetNext())
                            }

                            ;ホットキーをリストビューに追加
                            Loop, Parse, vHotkey, `r, `n
                            {
                                ;ホットキーのツリービューとリストビューを選択
                                Gui, TreeView, %sHwndHotkeyTree%
                                Gui, ListView, %sHwndHotkeyList%

                                If (vCurrentTree == vTreeTop || vCurrentTree == vTargetTreeId)
                                {
                                    ;ツリートップ選択中または読み込み行が選択中のツリーアイテムIDと一致する場合、リストビューに追加
                                    vListItemId := LV_Add("Col1", vTarget, A_LoopField, vCondition, vDesc)
                                }
                            }
                        }

                        If (vHotstr != "")
                        {
                            ;@hotstr行が存在していた場合、ツリービューとリストビューを選択
                            Gui, TreeView, %sHwndHotstrTree%
                            Gui, ListView, %sHwndHotstrList%

                            ;ツリーの先頭項目を取得
                            vTreeItemId := TV_GetNext()

                            ;読み込み行のツリーアイテムID
                            vTargetTreeId := ""

                            ;ツリーの項目数分ループ
                            Loop, % TV_GetCount()
                            {
                                ;ツリーの項目名称を取得
                                TV_GetText(vTreeText, vTreeItemId)
                                If (vTreeText == vTarget)
                                {
                                    ;ツリーの項目名称に存在した場合、ループ処理を終了
                                    vTargetTreeId := vTreeItemId
                                    Break
                                }

                                ;ツリーの項目名称に存在しない場合、次のツリー項目を取得しループを継続
                                vTreeItemId := TV_GetNext(vTreeItemId, "Full")
                            }

                            If (!vTargetTreeId)
                            {
                                ;ツリーの項目名称に存在しない場合、ツリーに項目を追加
                                vTargetTreeId := TV_Add(vTarget, TV_GetNext())
                            }

                            ;ホットストリングをリストビューに追加
                            Loop, Parse, vHotstr, `r, `n
                            {
                                ;ホットストリングのツリービューとリストビューを選択
                                Gui, TreeView, %sHwndHotstrTree%
                                Gui, ListView, %sHwndHotstrList%

                                If (vCurrentTree == vTreeTop || vCurrentTree == vTargetTreeId)
                                {
                                    ;ツリートップ選択中・読み込み行が選択中のツリーアイテムIDと一致する場合、リストビューに追加
                                    vListItemId := LV_Add("Col1", vTarget, A_LoopField, vCondition, vDesc)
                                }
                            }
                        }
                    }
                }
            }
        }
    Return

    /**
    * [Esc][閉じる]ボタンクリック時の動作。
    */
    HotkeyHelpGuiEscape:
    HotkeyHelpGuiClose:
        ;GUIウィンドウを破棄
        Gui, HotkeyHelp:Destroy
    Return
}

/**
 * 設定されたホットキー/ホットストリングを一覧表示
 *
 * @hotkey 無変換+[/]
 * @target デフォルト
 */
vk1D & P::
    IfWinNotExist, AutoHotkey設定一覧
    {
        HotkeyHelp()
    }
    Else
    {
        WinActivate
    }
Return