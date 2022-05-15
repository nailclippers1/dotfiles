#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory./セミコロン
F24 & /::send, {Blind}{End}
F24 & sc028::send, {Blind}{PgUp} ; コロン
F24 & sc073::send, {Blind}{PgDn} ; バックスラッシュ

F24 & h::send, {Blind}{Left}
F24 & l::send, {Blind}{Right}
F24 & k::send, {Blind}{Up}
F24 & j::send, {Blind}{Down}

F24 & Tab::send, {Blind}{CapsLock} ; 「英数」でない単独の「Caps Lock」

F24 & n::send, {Blind}{NumpadAdd}
F24 & m::send, {Blind}{NumpadSub}
F24 & ,::send, {Blind}{NumpadMult}
F24 & .::send, {Blind}{NumpadDiv}

F24 & Enter::send, {Blind}{NumpadEnter}

