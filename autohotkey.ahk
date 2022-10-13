;----------Setting----------

#NoEnv
#Warn
#Persistent
SendMode Input

;---------- 無変換キー ----------
vk1D::Return

~vk1D & H::Send,{Blind}{Left}
vk1D & J::Send,{Blind}{Down}
vk1D & K::Send,{Blind}{Up}
vk1D & L::Send,{Blind}{Right}

vk1D & Y::Send,{Blind}{Home}
vk1D & U::Send,{Blind}{PgDn}
vk1D & I::Send,{Blind}{PgUp}
vk1D & O::Send,{Blind}{End}

vk1D & N::Send,{Blind}^{Left}
;行入れ替え
vk1D & M::Send,{Blind}!{Down}
vk1D & ,::Send,{Blind}!{Up}
vk1D & .::Send,{Blind}^{Right}

vk1D & Q::Send, {Blind}^{q}
vk1D & W::Send, {Blind}^{w}
vk1D & E::Send, {Blind}^{e}
;Rename
vk1D & R::Send, {Blind}{F2}
;アドレスバーにフォーカス
vk1D & T::Send, {Blind}^{l}

vk1D & A::Send, {Blind}^{a}
vk1D & S::Send, {Blind}^{s}
vk1D & D::Send, {Blind}^{d}
vk1D & F::Send, {Blind}^{f}
vk1D & G::Send, {Blind}^{g}

vk1D & Z::Send, {Blind}^{z}
vk1D & X::Send, {Blind}^{x}
vk1D & C::Send, {Blind}^{c}
vk1D & V::Send, {Blind}#{v}
;ブックマーク
vk1D & B::Send, {Blind}^{b}

vk1D & [::Send, {Esc}
; back space
vk1D & Space::Send, {BS}
; 変換
vk1D & vk1C::Send, {vkF3sc029}

vk1D & Enter::Send, {Blind}^+{Enter}

vk1D & 1::Send, ^{1}
vk1D & 2::Send, ^{2}
vk1D & 3::Send, ^{3}
vk1D & 4::Send, ^{4}
vk1D & 5::Send, ^{5}
vk1D & 6::Send, ^{6}
vk1D & 7::Send, ^{7}
vk1D & 8::Send, ^{8}
vk1D & 9::Send, ^{9}
vk1D & 0::Send, ^{0}
;---------- 変換キー ----------
vk1C::Return

; 仮想デスクトップ、ウィンドウスイッチ
~vk1C & Y::Send, #^{Left}
vk1C & U::ShiftAltTab
vk1C & I::AltTab
vk1C & O::Send, #^{Right}

; ページ、タブスイッチ
vk1C & H::Send, !{Left}
vk1C & J::Send, ^+{Tab}
vk1C & K::Send, ^{Tab}
vk1C & L::Send, !{Right}

; ウィンドウ移動
vk1C & N::Send, #{Left}
vk1C & M::Send, #{Down}
vk1C & ,::Send, #{Up}
vk1C & .::Send, #{Right}


;ウィンドウを閉じる
vk1C & Q::WinClose,A
;タブを閉じる
vk1C & W::Send, {Blind}^{w}
;検索
vk1C & E::Send, #{s}
;リロード
vk1C & R::Send, {Blind}{F5}
;タブを開く
vk1C & T::Send, {Blind}^{t}

;アンドゥ
vk1C & A::Send, {Blind}^{z}
;スクリーンショットをとる
vk1C & S::Send, #+{S}
;ショートカットメニューを表示する
vk1C & D::Send, {Blind}+{F10}
;リドゥ
vk1C & F::Send, {Blind}^+{z}
vk1C & G::Send, {Blind}^{y}

;仮想デスクトップを開く閉じる切り替える
vk1C & Z::Send, {Blind}#^{Left}
vk1C & X::Send, {Blind}#^{F4}
vk1C & C::Send, {Blind}#^d
vk1C & V::Send, {Blind}#^{Right}

;タスクバーのピン止めメニューを開く
vk1C & 1::Send, #!{1}
vk1C & 2::Send, #!{2}
vk1C & 3::Send, #!{3}
vk1C & 4::Send, #!{4}
vk1C & 5::Send, #!{5}
vk1C & 6::Send, #!{6}
vk1C & 7::Send, #!{7}
vk1C & 8::Send, #!{8}
vk1C & 9::Send, #!{9}
vk1C & 0::Send, #!{0}

vk1C & Space::Send, {Delete}
vk1C & Enter::Send, {Blind}^{Enter}
;---------- LAlt ----------
;LAlt::Return
~LAlt & q::Send, {7}
LAlt & w::Send, {8}
LAlt & e::Send, {9}
LAlt & r::Send, {^}

LAlt & a::Send, {3}
LAlt & s::Send, {4}
LAlt & d::Send, {5}
LAlt & f::Send, {6}
LAlt & g::Send, {~}

LAlt & z::Send, {0}
LAlt & x::Send, {1}
LAlt & c::Send, {2}
LAlt & v::Send, {\}

LAlt & y::Send, {+}
LAlt & u::Send, {-}
LAlt & i::Send, {*}
LAlt & o::Send, {/}
LAlt & p::Send, {`%}

LAlt & h::Send, {=}
LAlt & j::Send, {(}
LAlt & k::Send, {)}
LAlt & l::Send, {!}

LAlt & n::Send, {|}
LAlt & m::Send, {[}
LAlt & ,::Send, {]}
LAlt & .::Send, {&}

; script のリロード
LAlt & vk1D::Reload
;---------- Ctrl ----------
;半角英数に変換
^Space::Send, {F10}
^[::Send, {Esc}

;---------- アプリごとのショートカット ----------
;Slack
#IfWinActive,ahk_exe slack.exe

vk1C & h::Send, ^+{Tab}
vk1C & j::Send, !+{Down}
vk1C & k::Send, !+{Up}
vk1C & l::Send, ^{Tab}

#IfWinActive

;エクスプローラ
#IfWinActive,ahk_exe Explorer.EXE

;アドレスバー
^L::Send, ^{E}

;親フォルダを開く
vk1C & J::Send, !{Up}
;プレビュー
vk1C & K::Send, !{P}

#IfWinActive

;VSCode
#IfWinActive,ahk_exe Code.exe


;---------- 無変換キー ----------
;画面横分割
vk1D & Q::Send, {Blind}^+{\}
;画面横分割
vk1D & W::Send, {Blind}^{\}

;Rename
vk1D & R::
Send, ^{0}
Send, {Blind}{F2}
Return

;スマート選択
vk1D & D::Send, {Blind}^{d}
;jumpy
vk1D & G::Send, {Blind}^{g}
;---------- 変換キー ----------

; アンドゥ、リドゥ
vk1C & H::Send, ^{z}
vk1C & L::Send, ^+{z}
;タブ切り替え
vk1C & K::
SetKeyDelay -1
Send {Blind}{LCtrl Down}
Send, {Tab}
Return

vk1C up::
SetKeyDelay -1
Send {Blind}{LCtrl Up}
Return


;サイドバーに移動
LAlt & Space::Send, ^{0}
;エディタに移動
LAlt & vk1C::Send, ^{1}

#IfWinActive


;Kindle
#IfWinActive,ahk_exe Kindle.exe

vk1C & h::Send, ^+{Tab}
vk1C & j::Send, !+{Down}
vk1C & k::Send, !+{Up}
vk1C & l::Send, ^{Tab}

#IfWinActive