# allow PowerShell scripts to run
if((Get-ExecutionPolicy -Scope LocalMachine) -ne "RemoteSigned"){Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force}

echo "set Registry entries"
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

echo "change $profile path for (Microsoft.PowerShell_profile.ps1) "
Remove-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "Personal"
New-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "Personal" -Value "$env:USERPROFILE\.config\windows" -PropertyType ExpandString


echo "restore context menu to Windows 10 style"
if (!(Test-Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}")) {
    New-item "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Force
    New-ItemProperty "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" "(default)" -Value ""
}

echo "set context menu for vim"
#if (!(Test-Path "HKCR:\*\shell\vim")) {
    #New-Item "HKCR:\*\shell\vim"
    reg add HKCR\*\shell\vim /f
    #New-ItemProperty "HKCR:\*\shell\vim" "(default)" -Value "Open with Vim (&N)"
    reg add HKCR\*\shell\vim /ve /d "Open with Vim (&W)" /f
    #New-ItemProperty "HKCR:\*\shell\vim" "Icon" -Value "C:\\Program Files\\Neovim\\bin\\nvim-qt.exe"
    reg add HKCR\*\shell\vim /v "Icon" /d "C:\Program Files\Neovim\bin\nvim-qt.exe" /f
    reg add HKCR\*\shell\vim\command /f
    reg add HKCR\*\shell\vim\command /ve /d "C:\Program Files\Neovim\bin\nvim-qt.exe %1" /f
#}

echo "set Symbolic links"
$source = "Dropbox\Sources"
if (!(Test-Path .config)) {
    New-Item $env:USERPROFILE\.config -ItemType Junction -Value dotfiles\.config
}
if (!(Test-Path bin)) {
    New-Item $env:USERPROFILE\bin -ItemType Junction -Value $source\bin
}
if (!(Test-Path share)) {
    New-Item $env:USERPROFILE\share -ItemType Junction -Value $source\share
}
if (!(Test-Path $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState.sav)) {
    Rename-Item $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState.sav
    New-Item $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -ItemType Junction -Value $env:USERPROFILE\.config\windows\WindowsTerminal\LO
}

echo "set Environment variables"
$env:XDG_CACHE_HOME="$env:USERPROFILE\.cache"
$env:XDG_CONFIG_HOME="$env:UserPROFILE\.config"
[Environment]::SetEnvironmentVariable("LANG","en_US",[System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("MOCWORD_DATA","C:\Users\taishi\share\dict\mocword.sqlite",[System.EnvironmentVariableTarget]::Machine)

if (-! $env:PATH.Contains("$env:USERPROFILE\bin")) {
    Set-item Env:\Path $env:PATH";$($env:USERPROFILE)\bin"
}