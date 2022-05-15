#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

$CapsLock::Ctrl

#Include alt-ime-ahk.ahk

;
; Fn: F24
;
F24 & 1::send, {Blind}{F1}
F24 & 2::send, {Blind}{F2}
F24 & 3::send, {Blind}{F3}
F24 & 4::send, {Blind}{F4}
F24 & 5::send, {Blind}{F5}
F24 & 6::send, {Blind}{F6}
F24 & 7::send, {Blind}{F7}
F24 & 8::send, {Blind}{F8}
F24 & 9::send, {Blind}{F9}
F24 & 0::send, {Blind}{F10}
F24 & -::send, {Blind}{F11}
F24 & =::send, {Blind}{F12}
F24 & Backspace::send, {Blind}{Delete}

F24 & p::send, {Blind}{PrintScreen}
F24 & [::send, {Blind}{ScrollLock}
F24 & ]::send, {Blind}{sc045} ; Pause / Break

F24 & sc027::send, {Blind}{Home} ; Semi-colon
F24 & sc034::send, {Blind}{End}  ; Comma
F24 & sc028::send, {Blind}{PgUp} ; Apostrophe
F24 & sc035::send, {Blind}{PgDn} ; Slash

F24 & h::send, {Blind}{Left}
F24 & l::send, {Blind}{Right}
F24 & k::send, {Blind}{Up}
F24 & j::send, {Blind}{Down}

F24 & Tab::send, {Blind}{CapsLock}